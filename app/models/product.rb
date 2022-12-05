class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :favorites, dependent: :destroy
  CATEGORIES =  ["Kitchen", "Living Room", "Office", "Bathroom", "Bedroom", "Dining Room", "Garden", "Other"]
  CONDITIONS = ["New", "Good", "Used"]

  include PgSearch::Model
  pg_search_scope :search_a_lot,
    against: [ :location, :title, :description, :image, :price, :material, :condition, :user_id, :category ],
    using: {
      tsearch: { prefix: true }
  }
end
