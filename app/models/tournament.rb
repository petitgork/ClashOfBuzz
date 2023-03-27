class Tournament < ApplicationRecord
  has_many :users, through: :user_tournaments
  has_many :matches
end
