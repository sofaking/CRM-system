class Account < ActiveRecord::Base
  has_many :projects, dependent: :delete_all
  belongs_to :user, touch: true
end
