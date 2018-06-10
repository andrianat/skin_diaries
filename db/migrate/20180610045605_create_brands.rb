class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :brandname

      t.timestamps

    end
  end
end
