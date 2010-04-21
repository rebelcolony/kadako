class Qualification < ActiveRecord::Base
  belongs_to :user
  belongs_to :body 
  belongs_to :category
  belongs_to :technique
  belongs_to :level
  has_attached_file :cert, :styles => { :medium => "800x800>", :thumb => "50x50>" }
end
