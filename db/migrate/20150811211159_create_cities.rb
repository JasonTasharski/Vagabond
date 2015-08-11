class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city_name
      t.string :short_name
      t.string :city_photo

      t.timestamps null: false
    end
  end
end
