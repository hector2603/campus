json.extract! course, :id, :name, :date_end, :created_at, :updated_at
json.url course_url(course, format: :json)