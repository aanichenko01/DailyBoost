class AddUsersToWorkouts < ActiveRecord::Migration[5.2]
  def up

    add_reference :workouts, :user, index: true
    Workout.reset_column_information
    user = User.first

    Workout.all.each do |workout|
      workout.user_id = user.id
      workout.save!
    end

    change_column_null :workouts, :user_id, false
    add_foreign_key :workouts, :users
  end

  def down
    remove_foreign_key :workouts, :users
    remove_reference :workouts, :user, index: true
  end

end
