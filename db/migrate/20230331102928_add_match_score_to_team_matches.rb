class AddMatchScoreToTeamMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :team_matches, :match_score, :integer, default: 0
  end
end
