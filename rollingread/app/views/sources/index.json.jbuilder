json.array!(@sources) do |source|
  json.extract! source, :id, :short_source, :source_details, :dummy, :course_id
  json.url source_url(source, format: :json)
end
