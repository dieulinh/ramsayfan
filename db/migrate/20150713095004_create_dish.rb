class CreateDish < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
    	t.string :title
    	t.text :description
    	t.decimal :cost, precision: 4, scale: 2
    	t.integer :pax
    	t.boolean :vegetarian
    	t.timestamps
    end
  end
end
