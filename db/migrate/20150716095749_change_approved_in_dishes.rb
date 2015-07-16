class ChangeApprovedInDishes < ActiveRecord::Migration
  def up
  	change_column :dishes, :approved, :boolean, default: false
  end
  
  def down
  	change_column :dishes, :approved, :boolean
  end
end
