class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :need_type

      t.timestamps

    end
  end
end
