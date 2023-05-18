class RenameTableExtractionsToExtractions < ActiveRecord::Migration[7.0]
  def change
    rename_table :table_extractions, :extractions
  end
end
