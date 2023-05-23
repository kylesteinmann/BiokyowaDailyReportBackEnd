class ChangeBirthdateDataTypeInUsersChangeDateInFermentation < ActiveRecord::Migration[7.0]
  def change
    change_column :fermentations, :date, :date
  end
end
