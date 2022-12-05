class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :product, uniqueness: { scope: :user }
end
