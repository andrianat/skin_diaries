class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description
      t.string :ingredients
      t.string :use
      t.string :product_name
      t.boolean :favorite

      t.timestamps

    end
  end
end
