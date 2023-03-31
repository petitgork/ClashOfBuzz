class RenameMatchResultToWinnerInMatches < ActiveRecord::Migration[7.0]
  def change
    rename_column :matches, :match_result, :winner
    change_column :matches, :winner, :string
  end
end
