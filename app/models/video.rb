class Video < ActiveRecord::Base
  attr_accessible :date, :description, :slug, :thumb, :title, :vimeo
end
