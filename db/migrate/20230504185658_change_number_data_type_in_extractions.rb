class ChangeNumberDataTypeInExtractions < ActiveRecord::Migration[7.0]
  def change
    change_column :extractions, :concentration, :decimal, precision: 10, scale: 2
    change_column :extractions, :volume, :decimal, precision: 15, scale: 2
    change_column :extractions, :weight, :decimal, precision: 15, scale: 2
    change_column :extractions, :level, :decimal, precision: 15, scale: 2
    change_column :extractions, :ph, :decimal, precision: 15, scale: 2
  end
end
