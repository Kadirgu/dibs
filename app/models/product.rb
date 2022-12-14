class Product < ApplicationRecord
  include OrderableByTimestamp

  belongs_to :user
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :favorites, dependent: :destroy
  has_many :chatrooms, dependent: :destroy

  validates :title, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, presence: true

  CATEGORIES = ["Kitchen", "Livingroom", "Office", "Bathroom", "Bedroom", "Diningroom", "Garden", "Other", "Spotted"]
  CONDITIONS = ["New", "Good", "Used"]
  MATERIALS = ["Metal", "Wood", "Leather", "Silk", "Cotton", "Plastic"]

  enum status: [:available, :not_available]

  include PgSearch::Model
  pg_search_scope :search_a_lot,
    against: [ :location, :title, :description, :image, :price, :material, :condition, :user_id, :category],
    using: {
      tsearch: { prefix: true }
  }
end
