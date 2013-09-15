class User < ActiveRecord::Base
  belongs_to :role
  has_one :account, dependent: :delete
  has_secure_password
  
  before_validation on: :create do
    self.email = email.downcase if attribute_present?("email")
    self.role ||= Role.find_by(title: "client")
    self.account ||= Account.create( project_count: 5 )
  end
  
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create
  validates_presence_of :email
  validates_associated :account
  validates_uniqueness_of :email
  
  def admin?
    role.title == 'admin'
  end
  
  def visiter?
    role.title == 'visiter'
  end
  
  def client?
    role.title == 'client'
  end
end
