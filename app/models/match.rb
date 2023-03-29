class Match < ApplicationRecord
  belongs_to :tournament
  has_many :line_ups, dependent: :destroy
  has_many :politics, through: :line_ups
  has_many :user_matches
  has_many :users, through: :user_matches
  has_many :team_matches, dependent: :destroy
  has_many :teams, through: :team_matches
end
