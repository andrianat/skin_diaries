class AddFavoriteCountToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :favorites_count, :integer
  end
end
