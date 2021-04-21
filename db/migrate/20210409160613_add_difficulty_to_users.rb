class AddDifficultyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :difficulty, :integer, null: false, default: 1
  end
end
