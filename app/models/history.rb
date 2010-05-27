class History < ActiveRecord::Base
  belongs_to :user
  belongs_to :sector
  validates_presence_of :sector, :user, :start, :end, :description, :company, :position, :equipment
end
