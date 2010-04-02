class User < ActiveRecord::Base
  acts_as_authentic
  has_many :qualifications
  has_many :histories
end
