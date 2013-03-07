class Photograph < ActiveRecord::Base
  just_define_datetime_picker :created_at, :add_to_attr_accessible => true

  attr_accessible :title, :description, :slug, :image_file

  has_attached_file :image_file, :styles => {
    :large => "2880x1800>",
    :medium => "1440x900>",
    :small => "800x500>"
  }

  after_post_process :save_image_dimensions

  def save_image_dimensions
    geo = Paperclip::Geometry.from_file(image_file.queued_for_write[:original])
    self.image_width = geo.width
    self.image_height = geo.height
  end

  def to_param
    "#{slug}"
  end

  def prev_path
    self.class.first(:conditions => ["created_at < ?", created_at], :order => "created_at DESC") || self.class.order('created_at DESC').first
  end

  def next_path
    self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at ASC") || self.class.order('created_at ASC').first
  end

  validates :image_file, :slug, :presence => true
end