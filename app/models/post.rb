class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :review
end

def blank_stars
  5 - rating.to_i
 end