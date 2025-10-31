class Page < ApplicationRecord
  has_many :posts, dependent: :destroy
end
