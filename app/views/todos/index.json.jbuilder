json.array!(@todos) do |todo|
  json.extract! todo, :name, :description, :date
  json.url todo_url(todo, format: :json)
end
