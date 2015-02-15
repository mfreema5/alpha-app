json.array!(@sections) do |section|
  json.extract! section, :id, :chapter_number, :details, :read_by, :source_id
  json.url section_url(section, format: :json)
end
