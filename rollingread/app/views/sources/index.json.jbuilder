json.array!(@sources) do |source|
<<<<<<< HEAD
  json.extract! source, :id
=======
  json.extract! source, :id, :short_title, :biblio_info, :url, :course_id
>>>>>>> 0535426fc2a2a057b99edf9097e6da1de9e0d3c8
  json.url source_url(source, format: :json)
end
