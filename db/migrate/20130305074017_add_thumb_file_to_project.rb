class AddThumbFileToProject < ActiveRecord::Migration
  def self.up
    add_attachment :projects, :thumb
  end

  def self.down
    remove_attachment :projects, :thumb
  end
end