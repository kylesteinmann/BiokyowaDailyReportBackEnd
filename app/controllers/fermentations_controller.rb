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
      #create notification upon creation of fermentation row
      create_notification(@fermentation, "A fermentation row has been created")
      render json: @fermentation, status: :created, location: @fermentation
    else
      render json: @fermentation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fermentations/1
  def update
    if @fermentation.update(fermentation_params)
      #create notif upon the edit of fermentation row
      create_notification(@fermentation, "A fermentation row has been edited")
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

    def create_notification(message)
      Notification.create(message: message)
    end
end
