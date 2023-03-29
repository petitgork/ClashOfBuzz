class Team < ApplicationRecord
  belongs_to :user
  belongs_to :tournament
  has_many :team_politics
  has_many :politics, through: :team_politics
  has_many :team_matches
  has_many :matches, through: :team_matches
end
