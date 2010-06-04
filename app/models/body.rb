class Body < ActiveRecord::Base
  validates_presence_of :name
  has_many :qualifications
  has_many :users, :through => :qualifications
  
  
  # Class methods
  class << self
    def dropdown
      [['All', 'all'] ] + all.map { |u| [u.name, u.id] }
    end
  end
  
  
end
