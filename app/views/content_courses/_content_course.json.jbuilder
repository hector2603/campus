json.extract! content_course, :id, :course_id, :content, :created_at, :updated_at
json.url content_course_url(content_course, format: :json)