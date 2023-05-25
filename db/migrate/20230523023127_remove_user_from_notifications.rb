class RemoveUserFromNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :user_id
  end
end
