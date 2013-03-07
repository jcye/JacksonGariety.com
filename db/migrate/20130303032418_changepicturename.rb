class Changepicturename < ActiveRecord::Migration
  def change
    rename_table :pictures, :shots
  end
end
