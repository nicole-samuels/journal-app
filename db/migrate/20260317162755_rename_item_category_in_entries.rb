class RenameItemCategoryInEntries < ActiveRecord::Migration[7.2]
  def change
    rename_column :entries, :itemcategory, :item_category
  end
end
