class Tournament < ApplicationRecord
  has_many :user_tournaments, dependent: :destroy
  has_many :users, through: :user_tournaments
  has_many :matches, dependent: :destroy
  has_many :teams
end
