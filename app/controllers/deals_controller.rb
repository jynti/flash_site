class DealsController < ApplicationController
  before_action :find_deal

  private
    def find_deal
      @deal = Deal.find_by(code: params[:id])
    end

end
