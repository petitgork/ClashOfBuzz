class CreateUserTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tournaments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
