class RenameEntriesToPatterns < ActiveRecord::Migration[7.2]
  def change
    # rename entries table to pattern
    rename_table :entries, :patterns

    # rename 'name' column to 'pattern name'
    rename_column :patterns, :name, :pattern_name

    # update constraint on 'pattern name' and 'item category' column
    change_column_null :patterns, :pattern_name, false
    change_column_null :patterns, :item_category, false

    # adding additonal columns
    add_column :patterns, :description, :string, null: false
    add_column :patterns, :level, :string, null: false

  end
end
