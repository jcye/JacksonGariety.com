class Changepicturetoshot < ActiveRecord::Migration
  def change
    rename_column :shots, :picture, :file
  end
end
