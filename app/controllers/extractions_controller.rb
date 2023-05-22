class ExtractionsController < ApplicationController
  before_action :set_extraction, only: %i[ show update destroy ]

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
      #create notification upon the save of the created extraction
      create_notification(@extraction, 'A new extraction row has been created')
      render json: @extraction, status: :created, location: @extraction
    else
      render json: @extraction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /extractions/1
  def update
    
    if @extraction.update(extraction_params)
      #create notif upon the update of the extraction table
      create_notification(@extraction, "An extraction row has been edited")
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

    def create_notification(message)
      Notification.create(message: message)
    end
end
