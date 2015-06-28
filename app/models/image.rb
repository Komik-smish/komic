class Image < ActiveRecord::Base
  has_many :accessories
  belongs_to :strip
end
