class BeersController < ApplicationController
  before_action :set_beer, only: [ :show ]

  def index
    @beers = Beer.all
    render json: @beers
  end

  def show
    render json: @beer
  end

  def create
    @beer = Beer.new(beer_attributes)
    if @beer.save
      render json: @beer, status: :created
    else
      render json: { errors: @beer.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_beer
    @beer = Beer.find_by(id: params[:id])
  end

  def beer_attributes
    params.require(:data).require(:attributes)
      .permit(:name, :style, :yeast, :hop, :malts, :ibu, :alcohol, :blg)
  end
end
