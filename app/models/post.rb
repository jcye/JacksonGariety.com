class Post < ActiveRecord::Base
  attr_accessible :content, :date, :slug, :thumb, :title
end
