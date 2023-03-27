class CreateLineUps < ActiveRecord::Migration[7.0]
  def change
    create_table :line_ups do |t|
      t.references :match, null: false, foreign_key: true
      t.references :politic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
