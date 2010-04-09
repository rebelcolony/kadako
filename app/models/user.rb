class User < ActiveRecord::Base
  acts_as_authentic
  has_many :qualifications
  has_many :histories
  has_attached_file :headshot, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifications.deliver_password_reset_instructions(self)
  end

end
