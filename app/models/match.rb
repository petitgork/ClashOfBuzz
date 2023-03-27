class Match < ApplicationRecord
  belongs_to :tournament
  has_many :line_ups
end
