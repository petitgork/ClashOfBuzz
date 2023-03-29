class DropUserMatches < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_matches
  end
end
