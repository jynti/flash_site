class PaymentsController < ApplicationController

  before_action :set_amount, only: :create
  before_action :ensure_current_user_exists

  def new
  end

  def create
    payment = current_cart.payments.build(amount: @amount)

    payment.handle_stripe_transaction(params[:stripeToken])
    payment.success
    redirect_to :root, flash: { success:  t('.success') }
    rescue Stripe::CardError => e
      payment.failure
      redirect_to :root, flash: { warning: e.message }
  end


  private
    def set_amount
      if current_cart.can_pay?
        @amount = (current_cart.total - current_cart.loyality_discount) * 100
      else
        redirect_to addresses_path, flash: { warning: t('payments.choose_address') }
      end
    end
end

