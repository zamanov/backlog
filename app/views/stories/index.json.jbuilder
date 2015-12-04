json.array!(@stories) do |story|
  json.extract! story, :id, :name, :rank, :points, :title, :notes
  json.url story_url(story, format: :json)
end
