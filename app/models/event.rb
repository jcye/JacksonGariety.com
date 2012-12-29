class Event < ActiveRecord::Base
  attr_accessible :description, :slug, :thumb, :title
end
