class Qualification < ActiveRecord::Base
  belongs_to :profile
  belongs_to :body 
  belongs_to :category
  belongs_to :technique
  belongs_to :level
end
