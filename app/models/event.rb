class Event < ActiveRecord::Base
  just_define_datetime_picker :created_at, :add_to_attr_accessible => true

  attr_accessible :description, :slug, :title, :event_type

  validates :event_type, :title, :created_at, :presence => true
end
