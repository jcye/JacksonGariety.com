class SaveImageGeometry < ActiveRecord::Migration
  def change
    add_column :shots, :image_width, :integer
    add_column:shots, :image_height, :integer
  end
end
