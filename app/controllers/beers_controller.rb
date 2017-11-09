class BeersController < ApplicationController
  before_action :set_beer, only: [ :show ]

  def index
    @beers = Beer.all
    render json: @beers
  end

  def show
    render json: @beer
  end

  private

  def set_beer
    @beer = Beer.find_by(id: params[:id])
  end
end
