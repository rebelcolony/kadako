class Sector < ActiveRecord::Base
  has_many :histories
  validates_presence_of :name
end
