class Sound < ActiveRecord::Base
  attr_accessible :album, :artist, :date, :description, :slug, :sound, :thumb, :title
end
