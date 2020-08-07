class Post < ApplicationRecord
	attachment :image
	belongs_to :user
	belongs_to :genre
	
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
