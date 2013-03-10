class Post < ActiveRecord::Base
  just_define_datetime_picker :created_at, :add_to_attr_accessible => true

  attr_accessible :content, :date, :slug, :thumb, :title

  has_attached_file :thumb,
                    :styles => {
                      :large => "660x660>",
                      :medium => "330x330>",
                      :small => "150x150>"
                    }

  def to_param
    "#{slug}"
  end

  validates :title, :content, :thumb, :slug, :presence => true

#   def prev_path
#     self.class.first(:conditions => ["created_at < ?", created_at], :order => "created_at DESC") || self.class.order('created_at DESC').first
#   end

  def next_path
    self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at ASC") || self.class.order('created_at ASC').first
  end
end