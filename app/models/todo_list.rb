class TodoList < ActiveRecord::Base
  has_many :todos, dependent: :delete_all
  accepts_nested_attributes_for :todos
end
