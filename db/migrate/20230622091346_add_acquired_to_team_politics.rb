class AddAcquiredToTeamPolitics < ActiveRecord::Migration[7.0]
  def change
    add_column :team_politics, :acquired, :boolean, default: false
  end
end
