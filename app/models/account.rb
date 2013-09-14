class Account < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_many :events, dependent: :delete_all
  belongs_to :user, touch: true
end
