class Project < ActiveRecord::Base
  has_many :todo_lists, dependent: :delete_all
end
