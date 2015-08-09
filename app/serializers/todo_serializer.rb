class TodoSerializer < ActiveModel::Serializer
  attributes :id, :desc, :due_date, :completed
end
