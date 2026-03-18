class AddItemCategoryToEntries < ActiveRecord::Migration[7.2]
  def change
    add_column :entries, :itemcategory, :string
  end
end
