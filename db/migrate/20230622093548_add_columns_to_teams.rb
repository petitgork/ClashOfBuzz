class AddColumnsToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :wallet, :integer, default: 500
    add_column :teams, :bids_closed, :boolean, default: false
  end
end
