class User < ActiveRecord::Base
  has_one :account, dependent: :delete
  has_secure_password
  
  before_validation on: :create do
    self.email = email.downcase if attribute_present?("email")
    self.account = Account.create
  end
  
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create
  validates_presence_of :email, :account
  validates_uniqueness_of :email
end
