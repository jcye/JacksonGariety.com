class Video < ActiveRecord::Base
  just_define_datetime_picker :created_at, :add_to_attr_accessible => true

  attr_accessible :date, :description, :slug, :title, :vimeo

  validates :vimeo, :title, :presence => true
end
