class Message < ApplicationRecord
  belongs_to :user
  belongs to :chatroom, dependent: :destroy
end
