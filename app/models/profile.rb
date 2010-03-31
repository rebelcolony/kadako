class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :qualifications
  has_many :histories
end
