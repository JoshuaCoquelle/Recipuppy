class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile

  has_many :posts    , dependent: :destroy
  has_many :comments , dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes    , dependent: :destroy

  
  has_many :favorited_posts, 
           through: :favorites, source: :post
  
  has_many :liked_posts,
           through: :likes, source: :post
  
end

