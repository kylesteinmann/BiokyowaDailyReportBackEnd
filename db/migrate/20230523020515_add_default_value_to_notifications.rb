class AddDefaultValueToNotifications < ActiveRecord::Migration[7.0]
  def change
    change_column_default :notifications, :read, false
  end
end
