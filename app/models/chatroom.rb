class Chatroom < ApplicationRecord
  belongs_to :product, dependent: :destroy
  belongs_to :user 
  has_many :messages
end
