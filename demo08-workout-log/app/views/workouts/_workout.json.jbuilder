json.extract! workout, :id, :date, :workout, :mood, :length, :created_at, :updated_at
json.url workout_url(workout, format: :json)