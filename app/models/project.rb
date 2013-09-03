class Project < ActiveRecord::Base
  belongs_to :account
  has_many :todo_lists, dependent: :delete_all
end
