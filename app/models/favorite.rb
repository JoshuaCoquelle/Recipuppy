class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def favorited_post?(user)
    favorites.exists?(user: user)
  end

end
