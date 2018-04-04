class AddressesController < ApplicationController

  before_action :ensure_current_cart_exists
  def index
    @addresses = current_user.addresses
    @address = delivered_orders.empty? ? @addresses.first : delivered_orders.last.address
  end


  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      redirect_to addresses_path, flash: { success: t('.success') }
    else
      flash.now[:warning] = t('.failure')
      render :new
    end
  end

  def new
    @address = Address.new
    @countries = Country.includes(:states).order(:name)
  end

  def submit
    current_cart.set_address(address_params[:id])
    redirect_to new_payment_url
  end

  private
    def address_params
      params.require(:address).permit(:id, :street1, :street2, :city, :pincode, :country_id, :state_id)
    end

    def delivered_orders
      current_user.orders.where(state: :delivered)
    end

    def ensure_current_cart_exists
      redirect_to :root, flash: { warning: t('welcome.buy_item') } unless current_cart.total
    end
end
