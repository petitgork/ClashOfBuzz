class Team < ApplicationRecord
  belongs_to :user
  belongs_to :tournament
  has_many :team_politics
  has_many :politics, through: :team_politics
end
