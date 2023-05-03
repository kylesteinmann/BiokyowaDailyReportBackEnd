class CreateTableExtractions < ActiveRecord::Migration[7.0]
  def change
    create_table :table_extractions do |t|
      t.date :date
      t.string :plant
      t.string :product
      t.string :campaign
      t.string :stage
      t.string :tank
      t.integer :concentration
      t.integer :volume
      t.integer :weight
      t.integer :level
      t.integer :ph

      t.timestamps
    end
  end
end
