class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :products
  has_many :messages
  has_many :chatrooms
  has_many :chatrooms_as_seller, through: :products, source: :chatrooms
  has_many :favorites, dependent: :destroy

end
