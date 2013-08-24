class TodoList < ActiveRecord::Base
  has_many :todos
  accepts_nested_attributes_for :todos
end
