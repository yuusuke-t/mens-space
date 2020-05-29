class Genre < ApplicationRecord
  has_many :posts, dependent: :destroy

  enum is_active: { enable: true, disable: false }
end
