class Project < ActiveRecord::Base
  attr_accessible :date, :description, :link, :slug, :thumb, :title, :type
end
