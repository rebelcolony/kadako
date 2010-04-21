class Qualification < ActiveRecord::Base
  belongs_to :user
  belongs_to :body 
  belongs_to :category
  belongs_to :technique
  belongs_to :level
  has_attached_file :cert, :styles => { :medium => "800x800>", :thumb => "50x50>" }
  validates_attachment_content_type :cert, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :cert, :less_than => 1.megabyte
end
