class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    dog_house = DogHouse.find(params[:id])
    render json: dog_house, include: :reviews
    #using include review will call .reviews method that is provied with has_many :reviews macro. 
    #nested has_many data. 
  end

  private

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end
