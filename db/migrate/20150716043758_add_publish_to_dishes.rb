class AddPublishToDishes < ActiveRecord::Migration
  def change
  	add_column :dishes, :published, :boolean, default: false
  end
end
