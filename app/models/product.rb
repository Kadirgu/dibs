class Product < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one_attached :photo
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?

end



# cheat-sheet:

# has_many :bookings, dependent: :destroy
# belongs_to :user
# has_one_attached :photo
# geocoded_by :location
# after_validation :geocode, if: :will_save_change_to_location?

# include PgSearch::Model
# pg_search_scope :search_a_lot,
# against: [ :location, :title, :description, :category, :interests, :age, :gender ],
# using: {
#   tsearch: { prefix: true }
# }
