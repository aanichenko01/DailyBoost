json.extract! logged_workout, :id, :name, :start_time, :user_id, :created_at, :updated_at
json.url logged_workout_url(logged_workout, format: :json)
