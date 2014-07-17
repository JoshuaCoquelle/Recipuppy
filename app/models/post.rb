class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments
  has_many :favorites
  has_many :likes
  has_many :dangers, dependent: :destroy
  has_many :dangered_users, through: :dangers, source: :user

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :ingredients, presence: true
  validates :potential_allergens, presence: true

  self.per_page = 5

  def liked_by?(user)
    likes.exists?(user: user)
  end

  def favorited_by?(user)
    favorites.exists?(user: user)
  end

  def marked_as_dangerous?(current_user)
    dangered_users.include? current_user
  end

  def exceeded_max_dangers?
    dangers.count >= 10
  end

  def marked_by?(user)
    dangers.exists?(user: user)
  end
  
end
