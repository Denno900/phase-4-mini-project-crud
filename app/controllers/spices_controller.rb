class SpicesController < ApplicationController
    wrap_parameters format: []
    def index
        render json: Spice.all
    end

    def show
        render json: Spice.find(params[:id])
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:id, :title, :image, :description, :notes, :rating)
    end

end
