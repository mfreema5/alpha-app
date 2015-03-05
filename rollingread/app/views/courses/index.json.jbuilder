json.array!(@courses) do |course|
  json.extract! course, :id, :course_number, :short_title, :description, :meet_days, :semester_id
  json.url course_url(course, format: :json)
end
