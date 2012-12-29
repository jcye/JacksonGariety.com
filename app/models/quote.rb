class Quote < ActiveRecord::Base
  attr_accessible :content, :date, :slug, :title
end
