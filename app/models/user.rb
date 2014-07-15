class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts    , dependent: :destroy
  has_many :comments , dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes    , dependent: :destroy
  has_many :dangers  , dependent: :destroy
  
  has_many :favorited_posts, 
           through: :favorites, source: :post
  
  has_many :liked_posts,
           through: :likes, source: :post

  validates :first_name, presence: true           
  validates :last_name, presence: true           
  validates :email, presence: true           
  validates :password, presence: true           
  
  def full_name
    fullname = "#{last_name}, #{first_name}"
  end

end

