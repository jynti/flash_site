class StatesController < ApplicationController
  before_action :find_states

  def index
    respond_to do |format|
      format.json { render json: @states }
    end
  end

  private
    def find_states
      @states = State.where(country_id: params[:country_id])
    end
end
