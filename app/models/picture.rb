class Picture < ActiveRecord::Base
  attr_accessible :date, :description, :picture, :slug, :title
end
