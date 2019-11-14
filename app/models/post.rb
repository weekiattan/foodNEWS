class Post < ActiveRecord::Base

  def self.search(search)
    if search
      where(["title ILIKE ?", "%#{search}%"])
    else
      all
    end
  end


  def blank_stars
    5 - rating.to_i
   end
  

  belongs_to :user
  belongs_to :category
  has_many :review



end