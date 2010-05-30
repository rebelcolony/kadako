class Search
  
  class << self
    def find(body_param, technique_param)
      
      users_body = []
      users_technique = []
      
      unless body_param.blank?
        if users = Body.find(body_param).users 
          users_body = users
          puts users_body
        end
      end
      
      unless technique_param.blank?
        if users = Technique.find(technique_param).users
          users_technique = users
        end
      end
      
      
      
      results = []
      
      if users_body.length > 0 && users_technique.length > 0
        results = users_body - (users_body - users_technique)
      elsif body_param.blank? && technique_param.blank?
        results = User.all
      else
        results = users_body + users_technique
      end
      
      results.uniq
      
    end
  end
end