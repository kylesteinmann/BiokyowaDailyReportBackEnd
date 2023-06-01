require 'csv'

class PackagingsController < ApplicationController
  before_action :set_packaging, only: %i[ show update destroy ]

  def import
    if params[:file].blank?
      render json: { error: 'No file attached' }, status: :unprocessable_entity
    else
      file = params[:file]
      CSV.foreach(file.path, headers: true) do |row|
        packaging_params = row.to_hash
        packaging_params['date'] = parse_date(packaging_params['date']) 
        Packaging.create(packaging_params)
      end
      render json: { message: 'Packaging data imported successfully' }, status: :ok
    end
  end

  # GET /packagings
  def index
    @packagings = Packaging.all

    render json: @packagings
  end

  # GET /packagings/1
  def show
    render json: @packaging
  end

  # POST /packagings
  def create
    @packaging = Packaging.new(packaging_params)

    if @packaging.save
      render json: @packaging, status: :created, location: @packaging
    else
      render json: @packaging.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /packagings/1
  def update
    if @packaging.update(packaging_params)
      render json: @packaging
    else
      render json: @packaging.errors, status: :unprocessable_entity
    end
  end

  # DELETE /packagings/1
  def destroy
    @packaging.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_packaging
      @packaging = Packaging.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def packaging_params
      params.require(:packaging).permit(:date, :plant, :product, :campaign, :packages, :incoming, :outgoing)
    end

    def parse_date(date_string)
      Date.strptime(date_string, '%d/%m/%Y') rescue nil
    end
end
