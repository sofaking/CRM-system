class Discussion < ActiveRecord::Base
  belongs_to :project
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
end
