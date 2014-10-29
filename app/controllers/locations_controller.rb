class LocationsController < ApplicationController
  before_action :set_location, only: [:show]

  # GET /locations
  def index
    @post = Post.where(page: "Locations").last
    @locations = Location.all
  end

  # GET /locations/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params[:location].permit(:name, :description, address_attributes: [:id, :street, :township, :city, :state, :country, :zip, :_destroy])
    end
end
