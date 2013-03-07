class ReanemClientToSideProject < ActiveRecord::Migration
  def change
    rename_column :projects, :client, :side_project
    remove_column :videos, :slug
    remove_column :projects, :slug
    remove_column :events, :slug
  end
end
