class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :name, null: false
      t.integer :duration
      t.integer :calories

      t.timestamps
    end
  end
end
