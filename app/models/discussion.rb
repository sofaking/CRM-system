class Discussion < ActiveRecord::Base
  belongs_to :project
  has_one :user, as: :creator
end
