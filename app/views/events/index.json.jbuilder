json.array!(@events) do |event|
  json.extract! event, :title, :description, :starts_at, :ends_at, :all_day
  json.url event_url(event, format: :json)
end
