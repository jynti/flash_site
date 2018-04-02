class WelcomeController < ApplicationController
  def index
    @past_deals = Deal.past_deals.limit(2)
    @published_deals = Deal.published_deals
  end

  def live_deal
    @deal = Deal.find_by(id: params[:id])
    respond_to do |format|
      format.js
    end
  end
end
