class Project < ActiveRecord::Base
  belongs_to :account
  has_many :todo_lists, dependent: :delete_all
<<<<<<< HEAD
  has_many :discussions, dependent: :delete_all
=======
  has_many :events, dependent: :delete_all
>>>>>>> master
end
