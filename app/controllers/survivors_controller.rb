class SurvivorsController < ApplicationController
  before_action :find_survivor, only: [:show]

  def index
    survivors = Survivor.all
    render json: survivors
  end

  def show
    render json: @survivor
  end

  def new
    @survivor = Survivor.new
  end

  def edit
  end

  def create
    @survivor = Survivor.new(create_survivor_params)

    if @survivor.save
      render json: {message: 'Save successful'}
    else
    end
  end

  def update
  end

  def destroy
  end

  def show_percentage_abducted
  end

  private

  def create_survivor_params
    params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude)
  end

  def update_location_params
    params.require(:survivor).permit(:latitude, :longitude)
  end

  def flagging_params
    params.require(:survivor).permit(:number_of_flags)
  end

  def find_survivor
    @survivor = Survivor.find(params[:id])
  end
end
