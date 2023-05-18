class CreateFermentations < ActiveRecord::Migration[7.0]
  def change
    create_table :fermentations do |t|
      t.string :date
      t.string :plant
      t.string :product
      t.string :campaign
      t.string :stage
      t.string :tank
      t.decimal :level
      t.decimal :weight
      t.decimal :received

      t.timestamps
    end
  end
end
