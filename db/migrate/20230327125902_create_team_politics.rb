class CreateTeamPolitics < ActiveRecord::Migration[7.0]
  def change
    create_table :team_politics do |t|
      t.references :team, null: false, foreign_key: true
      t.references :politic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
