class User < ActiveRecord::Base
  acts_as_authentic
  has_many :qualifications
  has_many :histories
  has_attached_file :headshot, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  #validates_attachment_content_type :headshot, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  #validates_attachment_size :headshot, :less_than => 1.megabyte, :message => "must be smaller than 1MB"
  
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifications.deliver_password_reset_instructions(self)
  end


  def work_experience
    for history in @user.histories
		  @time = (history.end.month - history.start.month) + (12 * (history.end.year - history.start.year))
		  @experience = @time / 12.0
		  @experience.round(1).to_f
	    total_experience += @experience
	  end
    @work_experience = total_experience
  end
end
