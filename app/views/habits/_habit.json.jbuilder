json.extract! habit, :id, :date, :category, :hours, :minutes, :description, :created_at, :updated_at
json.url habit_url(habit, format: :json)
