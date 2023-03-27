class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: true
      t.string :name
      t.integer :number_of_politics
      t.string :avatar

      t.timestamps
    end
  end
end
