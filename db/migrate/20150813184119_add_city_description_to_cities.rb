class AddCityDescriptionToCities < ActiveRecord::Migration
  def change
    add_column :cities, :city_description, :text
  end
end
