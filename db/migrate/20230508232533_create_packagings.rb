class CreatePackagings < ActiveRecord::Migration[7.0]
  def change
    create_table :packagings do |t|
      t.date :date
      t.string :plant
      t.string :product
      t.string :campaign
      t.string :package
      t.decimal :incoming
      t.decimal :outgoing

      t.timestamps
    end
  end
end
