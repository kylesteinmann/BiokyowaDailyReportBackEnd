class Change < ActiveRecord::Migration[7.0]
  def change
    change_column.default :users, :role, default = 2
  end
end
