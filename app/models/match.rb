class Match < ApplicationRecord
  belongs_to :tournament
  has_many :line_ups, dependent: :destroy
  has_many :politics, through: :line_ups
  has_many :user_matches
  has_many :users, through: :user_matches
  has_many :team_matches, dependent: :destroy
  has_many :teams, through: :team_matches

  def my_team_match(user)
    # récupération des team_matches pour un match en particulier (match = self)
    team_matches = self.team_matches.pluck(:id)
    # récupération de mon team_match du match
    user.team_matches.find { |team_match| team_matches.include?(team_match.id) }
  end
end
