class AddMercatoToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :Mercato, :boolean, default: true
  end
end
