class Suggestion < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :subject,:description,:user_id
end
