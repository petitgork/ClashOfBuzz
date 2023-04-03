class TeamMatch < ApplicationRecord
  belongs_to :team
  belongs_to :match
  has_many :line_ups, through: :match
end
