class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :category
      t.string :description
      t.string :active_ingredients
      t.string :use
      t.integer :brand_id

      t.timestamps

    end
  end
end
