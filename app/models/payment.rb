class Payment < ApplicationRecord
  belongs_to :order

  state_machine :state, initial: :balance_due do
    after_transition :balance_due => :paid, do: :set_order_success
    after_transition :balance_due => :failed, do: :set_order_failure

    event :success do
      transition :balance_due => :paid
    end

    event :failure do
      transition :balance_due => :failed
    end
  end

  def set_order_success
    order.pay
    PaymentMailer.successful_payment(order.user.id).deliver_later
    save_charge
  end

  def set_order_failure
    order.mark_fail
    PaymentMailer.failed_payment(order.user.id).deliver_later
    save_charge
  end

  def save_charge
    self.token = @charge.id
    self.failure_message = @charge.failure_message
    save
  end

  def handle_stripe_transaction(token)
    customer = StripeTool.create_customer(order.user.email, token)
    @charge = StripeTool.create_charge(customer.id, amount)
  end
end
