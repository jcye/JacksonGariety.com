class Quote < ActiveRecord::Base
  just_define_datetime_picker :created_at, :add_to_attr_accessible => true

  attr_accessible :content, :date, :slug, :author

  def to_param
    "#{slug}"
  end

  validates :content, :author, :slug, :presence => true
end
