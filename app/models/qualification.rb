class Qualification < ActiveRecord::Base
  belongs_to :user
  belongs_to :body 
  belongs_to :category
  belongs_to :technique
  belongs_to :level
  has_attached_file :cert, :styles => { :medium => "800x800>", :thumb => "50x50>" }
  
  #validates_attachment_content_type :cert, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'], 
                                           #:message => "must be either .jpg, .png, or .gif format"
  #validates_attachment_size :cert, :less_than => 1.megabyte, :message => "must be smaller than 1MB"
  
  
  named_scope :by_body, lambda { |body|
    {
     :conditions => ["body_id = ?", body.id] 
    }
  }
  
  named_scope :by_technique, lambda { |body|
    {
     :conditions => ["body_id = ?", body.id] 
    }
  }
  
  
  named_scope :by_body_and_technique, lambda { |body, technique|
    {
     :conditions => ["body_id = ? AND technique_id = ?", body.id, technique.id] 
    }
  }
  
  
  class << self
  
    def search(body, technique)
      
      results = []
      if body && technique
        results = self.by_body_and_technique(body, technique).map { |u| u.user }
      elsif body
        results = self.by_body(body).map { |u| u.user }
      elsif technique
        results = self.by_technique(technique).map { |u| u.user }
      else
        results = User.all
      end
      res_uniq = results.uniq
      res_uniq.select { |u| u != nil }
    end
    
  end
  
  
  

end
