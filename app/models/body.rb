class Body < ActiveRecord::Base
  validates_presence_of :name
  has_many :qualifications
end
