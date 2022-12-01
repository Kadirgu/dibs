class Chatroom < ApplicationRecord
  belongs_to :product, dependent: :destroy
  has_many :messages
end
