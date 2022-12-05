class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :favorites, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  CATEGORIES = ["Kitchen", "Livingroom", "Office", "Bathroom", "Bedroom", "Dining Room", "Garden", "Other"]
  CONDITIONS = ["New", "Good", "Used"]
  MATERIALS = ["Metal", "Wood", "Leather", "Silk", "Cotton", "Plastic"]

  include PgSearch::Model
  pg_search_scope :search_a_lot,
    against: [ :location, :title, :description, :image, :price, :material, :condition, :user_id, :category ],
    using: {
      tsearch: { prefix: true }
  }
end
