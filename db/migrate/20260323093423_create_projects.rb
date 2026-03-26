class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :status
      t.string :yarn_used
      t.string :yarn_weight
      t.decimal :yarn_price
      t.string :purchase_link
      t.integer :yarn_quantity
      t.string :needle_size
      t.string :garment_size
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
