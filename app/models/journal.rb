class Journal < ActiveRecord::Base
  attr_accessible :content, :date, :header, :slug, :sources, :thumb, :title
end
