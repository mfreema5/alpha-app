json.array!(@courses) do |course|
  json.extract! course, :id, :course_number, :short_title, :description, :meet_time, :meet_day
  json.url course_url(course, format: :json)
end
