class Project < ActiveRecord::Base
  has_and_belongs_to_many :account
  has_many :todo_lists, dependent: :delete_all
  has_many :events, dependent: :delete_all
end
