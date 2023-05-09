class ChangePackagingsColumnPackage < ActiveRecord::Migration[7.0]
  def change
    rename_column :packagings, :package, :packages
  end
end
