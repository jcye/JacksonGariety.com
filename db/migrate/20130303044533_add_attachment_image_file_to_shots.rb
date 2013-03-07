class AddAttachmentImageFileToShots < ActiveRecord::Migration
  def self.up
    change_table :shots do |t|
      t.attachment :image_file
    end
  end

  def self.down
    drop_attached_file :shots, :image_file
  end
end
