json.extract! exercise, :id, :workout_id, :title, :sets, :reps, :created_at, :updated_at
json.url exercise_url(exercise, format: :json)
