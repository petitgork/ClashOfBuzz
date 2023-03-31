class RenameMatchResultToWinnerInMatches < ActiveRecord::Migration[7.0]
  def change
    rename_column :matches, :match_result, :winner
  end
end
