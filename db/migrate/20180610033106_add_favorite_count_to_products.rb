class AddFavoriteCountToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :favorites_count, :integer
  end
end
