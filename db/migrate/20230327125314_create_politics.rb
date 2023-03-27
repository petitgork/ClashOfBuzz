class CreatePolitics < ActiveRecord::Migration[7.0]
  def change
    create_table :politics do |t|
      t.string :first_name
      t.string :last_name
      t.string :politic_board
      t.string :avatar

      t.timestamps
    end
  end
end
