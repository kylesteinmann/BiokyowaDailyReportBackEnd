class RemoveReadFromNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :read
  end
end
