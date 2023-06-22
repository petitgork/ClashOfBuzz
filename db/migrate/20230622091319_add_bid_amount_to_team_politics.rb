class AddBidAmountToTeamPolitics < ActiveRecord::Migration[7.0]
  def change
    add_column :team_politics, :bidAmount, :integer, default: 0
  end
end
