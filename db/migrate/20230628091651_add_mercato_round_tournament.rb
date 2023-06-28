class AddMercatoRoundTournament < ActiveRecord::Migration[7.0]
  def change
    add_column :tournaments, :mercato_round, :integer, default: 1
  end
end
