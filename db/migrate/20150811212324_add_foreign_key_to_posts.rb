class AddForeignKeyToPosts < ActiveRecord::Migration
  change_table :posts do |t|
  	t.belongs_to :city
  end
end
