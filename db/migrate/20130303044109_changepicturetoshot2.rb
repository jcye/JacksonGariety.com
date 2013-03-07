class Changepicturetoshot2 < ActiveRecord::Migration
  def change
    rename_column :shots, :file, :image_file
  end
end