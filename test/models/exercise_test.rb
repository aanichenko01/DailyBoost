require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase

  #Creates a workout to associate exercises to
  setup do
    @workout = workouts(:one)
  end

  test 'should not save empty exercise' do
    exercise = Exercise.new

    exercise.save
    refute exercise.valid?
  end

  test 'should save valid exercise' do
    exercise = Exercise.new

    exercise.title = 'My Exercise'
    exercise.workout = @workout
    exercise.category = 'Abs'
    exercise.description = 'Do a plank'
    exercise.equipment = 'None'
    exercise.sets = 3
    exercise.reps = 10

    exercise.save
    assert exercise.valid?
  end

  test 'should not save exercise without title' do
    exercise = Exercise.new

    exercise.workout = @workout
    exercise.sets = 3
    exercise.reps = 10
    exercise.category = 'Abs'
    exercise.description = 'Do a plank'
    exercise.equipment = 'None'

    exercise.save
    refute exercise.valid?
  end

  test 'should not save exercise without workout' do
    exercise = Exercise.new

    exercise.title = 'My Exercise'
    exercise.sets = 3
    exercise.reps = 10
    exercise.category = 'Abs'
    exercise.description = 'Do a plank'
    exercise.equipment = 'None'

    exercise.save
    refute exercise.valid?
  end

  test 'should destroy exercise with workout' do 
    exercise = Exercise.new

    exercise.title = 'My Exercise'
    exercise.workout = @workout
    exercise.sets = 3
    exercise.reps = 10
    exercise.category = 'Abs'
    exercise.description = 'Do a plank'
    exercise.equipment = 'None'

    exercise.save
    @workout.destroy
    
    refute Exercise.exists?(exercise.id)
  end
  
end
