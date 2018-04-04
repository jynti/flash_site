class LineItemsController < ApplicationController

  before_action :ensure_state, only: :create
  before_action :find_line_item, only: :destroy

  def create
    @line_item = current_cart.line_items.build(line_item_params)
    if @line_item.save
      redirect_to root_url, flash: { success: t('.success') }
    else
      redirect_to root_url, flash: { warning: @line_item.errors[:base].to_sentence }
    end
  end

  def index
    @line_items = current_cart.line_items.includes(deal: :images)
  end

  def destroy
    if @line_item.destroy
      redirect_to line_items_url, flash: { success: t('.success') }
    else
      flash.now[:warning] = t('.failure')
      render :index
    end
  end

  private
    def line_item_params
      params.permit(:deal_id, :price)
    end

    def ensure_state
      current_cart.add_line_item if current_cart.address?
    end

    def find_line_item
      @line_item = LineItem.find_by(params[:id])
    end
end
