class NewThings < ActiveRecord::Migration
  def change
    rename_table :shots, :photographs
  end
end
