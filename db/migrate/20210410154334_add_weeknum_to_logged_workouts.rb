class AddWeeknumToLoggedWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :logged_workouts, :week_num, :integer
  end
end
