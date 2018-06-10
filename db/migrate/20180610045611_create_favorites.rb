class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :users_id
      t.integer :products_id
      t.integer :brands_id
      t.integer :needs_id

      t.timestamps

    end
  end
end
