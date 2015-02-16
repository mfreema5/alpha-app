json.array!(@courses) do |course|
  json.extract! course, :id, :course_number, :short_title, :description, :meet_day1, :meet_day2, :meet_day3, :meet_day4, :meet_day5, :meet_day6, :meet_day7, :semester_id
  json.url course_url(course, format: :json)
end
