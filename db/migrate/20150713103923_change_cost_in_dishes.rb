class ChangeCostInDishes < ActiveRecord::Migration
  
  def up
  	change_column :dishes, :cost, :decimal, precision: 6, scale: 2
  end

  def down
  	change_column :dishes, :cost, :decimal, precision: 4, scale: 2
  end
end
