class FermentationsController < ApplicationController
  before_action :set_fermentation, only: %i[ show update destroy ]

  # GET /fermentations
  def index
    @fermentations = Fermentation.all

    render json: @fermentations
  end

  # GET /fermentations/1
  def show
    render json: @fermentation
  end

  # POST /fermentations
  def create
    @fermentation = Fermentation.new(fermentation_params)

    if @fermentation.save
      render json: @fermentation, status: :created, location: @fermentation
    else
      render json: @fermentation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fermentations/1
  def update
    if @fermentation.update(fermentation_params)
      render json: @fermentation
    else
      render json: @fermentation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fermentations/1
  def destroy
    @fermentation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fermentation
      @fermentation = Fermentation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fermentation_params
      params.require(:fermentation).permit(:date, :plant, :product, :campaign, :stage, :tank, :level, :weight, :received)
    end
end
