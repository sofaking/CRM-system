class User < ActiveRecord::Base
  has_one :account, dependent: :delete
  has_secure_password
  
  before_validation on: :create do
    self.account = Account.create
  end
  
  validates_presence_of :account
end
