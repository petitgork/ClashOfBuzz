class ChangeColumnNameToTeamPolitics < ActiveRecord::Migration[7.0]
  def change
    rename_column :team_politics, :bidAmount, :bid_amount
  end
end
