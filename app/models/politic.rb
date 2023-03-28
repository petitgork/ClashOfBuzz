class Politic < ApplicationRecord
  has_many :line_ups
  has_many :team_politics
  has_many :teams, through: :team_politics
  has_many :team_politics
  
end
