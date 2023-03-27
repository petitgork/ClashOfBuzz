class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :status
      t.integer :final_result

      t.timestamps
    end
  end
end
