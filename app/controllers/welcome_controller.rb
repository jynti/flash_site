class WelcomeController < ApplicationController
  skip_before_action :ensure_current_user_exists
  def index
    @past_deals = Deal.past_deals.limit(2)
    @published_deals = Deal.published_deals
    flash.now[:warning] = t('.no_published_deals') if @published_deals.empty? && !params[:past_deals]
  end

  def live_deal
    @deals = Deal.published_deals
    respond_to do |format|
      format.js
    end
  end
end
