json.array!(@sections) do |section|
  json.extract! section, :id, :chapter_number, :details, :read_by, :completed, :source_id
  json.url section_url(section, format: :json)
end
