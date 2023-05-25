class NotificationsController < ApplicationController
    before_action :set_session_notification, only: [:create]
  
    def index
      @notifications = Notification.all
      render json: @notifications
    end
  
    def create
      @notification = Notification.new(notification_params)
      @notification.message = @message
  
      if @notification.save
        render json: @notification, status: :created
      else
        render json: @notification.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @notification = Notification.find(params[:id])
      @notification.destroy
    end
  
    private
  
    def notification_params
      params.fetch(:notification, {}).permit(:message)
    end
  
    def set_session_notification
        puts session[:createMessage] 
        @message = session[:createMessage]
      end
      
  end
  