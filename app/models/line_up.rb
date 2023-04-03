class LineUp < ApplicationRecord
  belongs_to :match
  belongs_to :politic
  belongs_to :team
end
