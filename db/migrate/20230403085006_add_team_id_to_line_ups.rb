class AddTeamIdToLineUps < ActiveRecord::Migration[7.0]
  def change
    add_reference :line_ups, :team, null: false, foreign_key: true
  end
end
