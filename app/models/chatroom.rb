class Chatroom < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :seller, through: :product, source: :user
  has_many :messages, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :chatroom_search,
  associated_against: {
    user: [ :first_name, :last_name ],
    seller: [ :first_name, :last_name ],
    product: [ :title ],
  },
  using: {
    tsearch: { prefix: true }
  }
end
