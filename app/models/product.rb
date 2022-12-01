class Product < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_a_lot,
    against: [ :location, :title, :description, :image, :price, :material, :condition, :user_id ],
    using: {
      tsearch: { prefix: true }
  }
end

