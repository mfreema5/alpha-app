json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :short_title, :details, :url, :due_date, :completed, :source_id
  json.url assignment_url(assignment, format: :json)
end
