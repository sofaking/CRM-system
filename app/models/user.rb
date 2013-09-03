class User < ActiveRecord::Base
  has_one :account, dependent: :delete
  has_secure_password
end
