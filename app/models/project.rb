class Project < ActiveRecord::Base
  just_define_datetime_picker :created_at, :add_to_attr_accessible => true

  attr_accessible :description, :link, :slug, :thumb, :title, :side_project

  has_attached_file :thumb, :styles => {
    :large => "600x600>",
    :medium => "300x300>",
    :small => "150x150>"
  }

  validates :title, :link, :presence => true
end
