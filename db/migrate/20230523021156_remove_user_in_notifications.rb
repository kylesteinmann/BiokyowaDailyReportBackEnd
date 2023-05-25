class RemoveUserInNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :user
  end
end
