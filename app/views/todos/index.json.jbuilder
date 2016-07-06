json.array!(@todos) do |todo|
  json.extract! todo, :id, :item, :completed
  json.url todo_url(todo, format: :json)
end
