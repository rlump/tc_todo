json.array!(@todos) do |todo|
  json.extract! todo, :id, :desc, :due_date, :completed, :user_id
  json.url todo_url(todo, format: :json)
end
