class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.float :longitude
      t.float :latitude
      t.string :name

      t.timestamps null: false
    end
  end
end
