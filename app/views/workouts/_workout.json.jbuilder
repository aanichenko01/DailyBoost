json.extract! workout, :id, :name, :duration, :fitness_goal, :created_at, :updated_at
json.url workout_url(workout, format: :json)
