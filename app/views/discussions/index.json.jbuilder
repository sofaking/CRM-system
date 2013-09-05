json.array!(@discussions) do |discussion|
  json.extract! discussion, :title, :description
  json.url discussion_url(discussion, format: :json)
end
