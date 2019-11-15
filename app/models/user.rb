class User < ApplicationRecord
  has_many :post, dependent: :destroy
  has_many :review, dependent: :destroy
  has_many :follows

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'

  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'

  has_many :following, through: :follower_relationships, source: :following
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end