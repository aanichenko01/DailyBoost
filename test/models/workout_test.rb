require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  
  #Creates a user to associate workout to
  setup do
    @user = users(:one)
  end

  test 'should not save empty workout' do
    workout = Workout.new

    workout.save
    refute workout.valid?
  end

  test 'should save valid workout' do
    workout = Workout.new

    workout.name = 'My First Workout'
    workout.fitness_goal = 'Endurance'
    workout.user = @user

    workout.save
    assert workout.valid?
  end

  test 'should not save workout without name' do
    workout = Workout.new

    workout.fitness_goal = 'Endurance'
    workout.user = @user

    workout.save
    refute workout.valid?
  end

  test 'should not save workout without user' do
    workout = Workout.new

    workout.name = 'My First Workout'
    workout.fitness_goal = 'Endurance'

    workout.save
    refute workout.valid?
  end

end
