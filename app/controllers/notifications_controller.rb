class NotificationsController < ApplicationController
    def index
        @notifications = Notification.all

        render json: @notifications
    end

    def create
        @notication = Notification.new(notification_params)

        if @notication.save
            render json: @notication, status: :created
        else
            render json: @notication.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @notification = Notification.find(params[:id])
        @notication.destroy
    end

    private

    def notification_params
        params.require(:notification).permit(:message, :read_status, :user_id)
      end
end