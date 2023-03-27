class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :tournament, null: false, foreign_key: true
      t.integer :match_result

      t.timestamps
    end
  end
end
