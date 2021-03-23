json.extract! workout, :id, :date, :name, :duration, :calories, :created_at, :updated_at
json.url workout_url(workout, format: :json)
