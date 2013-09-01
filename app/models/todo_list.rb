class TodoList < ActiveRecord::Base
  belongs_to :project, touch: true
  has_many :todos, dependent: :delete_all
end
