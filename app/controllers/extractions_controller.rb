require 'csv'

class ExtractionsController < ApplicationController
  before_action :set_extraction, only: %i[ show update destroy ]

  def import
    if params[:file].blank?
      render json: { error: 'No file attached' }, status: :unprocessable_entity
    else
      file = params[:file]
      CSV.foreach(file.path, headers: true) do |row|
        extraction_params = row.to_hash
        extraction_params['date'] = parse_date(extraction_params['date']) 
        Extraction.create(extraction_params)
      end
      render json: { message: 'Extraction data imported successfully' }, status: :ok
    end
  end

  # GET /extractions
 def index
      @extractions = Extraction.all

    render json: @extractions
  
  end

  # GET /extractions/1
  def show
    render json: @extraction
  end

  # POST /extractions
  def create
    @extraction = Extraction.new(extraction_params)
    
    if @extraction.save
      render json: @extraction, status: :created, location: @extraction
    else
      render json: @extraction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /extractions/1
  def update
    
    if @extraction.update(extraction_params)
        
      render json: @extraction
    else
      render json: @extraction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /extractions/1
  def destroy
    @extraction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extraction
      @extraction = Extraction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def extraction_params
      params.require(:extraction).permit(:date, :product, :campaign, :stage, :tank, :concentration, :volume, :weight, :level, :ph, :plant)
    end

    def parse_date(date_string)
      Date.strptime(date_string, '%d/%m/%Y') rescue nil
    end
end
