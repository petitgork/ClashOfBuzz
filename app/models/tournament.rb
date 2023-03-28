class Tournament < ApplicationRecord
  has_many :users, through: :user_tournaments
  has_many :matches, dependent: :destroy
  has_many :tournaments, dependent: :destroy
end
