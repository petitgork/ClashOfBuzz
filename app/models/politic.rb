class Politic < ApplicationRecord
  has_many :line_ups
  has_many :teams, through: :team_politics
end
