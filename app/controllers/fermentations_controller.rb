require 'csv'

class FermentationsController < ApplicationController
  before_action :set_fermentation, only: %i[ show update destroy ]

  def import
    if params[:file].blank?
      render json: { error: 'No file attached' }, status: :unprocessable_entity
    else
      file = params[:file]
      CSV.foreach(file.path, headers: true) do |row|
        fermentation_params = row.to_hash
        fermentation_params['date'] = parse_date(fermentation_params['date']) 
        Fermentation.create(fermentation_params)
      end
      render json: { message: 'Fermentation data imported successfully' }, status: :ok
    end
  end

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

  def set_fermentation
    @fermentation = Fermentation.find(params[:id])
  end

  def fermentation_params
    params.require(:fermentation).permit(:date, :plant, :product, :campaign, :stage, :tank, :level, :weight, :received)
  end

   def parse_date(date_string)
    Date.strptime(date_string, '%d/%m/%Y') rescue nil
  end
end
