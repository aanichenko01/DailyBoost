class CreateLoggedWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :logged_workouts do |t|
      t.string :name
      t.datetime :start_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
