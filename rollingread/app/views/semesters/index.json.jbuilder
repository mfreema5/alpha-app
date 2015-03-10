json.array!(@semesters) do |semester|
  json.extract! semester, :id, :short_semester, :full_semester, :start_date, :end_date
  json.url semester_url(semester, format: :json)
end
