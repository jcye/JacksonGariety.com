class RenameTypeToClient < ActiveRecord::Migration
  def change
    rename_column :projects, :type, :client
  end
end
