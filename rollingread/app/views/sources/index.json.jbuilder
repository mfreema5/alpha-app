json.array!(@sources) do |source|
  json.extract! source, :id, :short_title, :biblio_info, :url, :course_id
  json.url source_url(source, format: :json)
end
