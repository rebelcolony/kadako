class Search
  
  class << self
    def find(body_param, technique_param)
      
      
      puts "body_param = " + body_param.to_s
      puts "technique_param = " + technique_param.to_s
      
      users_body = []
      users_technique = []
      
      unless body_param.blank? || body_param == 0
        if users = Body.find(body_param).users 
          users_body = users
          puts users_body.inspect
        end
      end
      
      
      puts "----------------------"
      
      unless technique_param.blank? || technique_param == 0
        if users = Technique.find(technique_param).users
          users_technique = users
          puts users_technique.inspect
        end
      end
      
      
      results = []
      
      if should_and_results?(users_body, users_technique, body_param, technique_param)
        puts "ANDING THE RESULTS"
        results = users_body - (users_body - users_technique)
      elsif all_search?(body_param, technique_param)
        results = User.all
      else
        results = users_body + users_technique
      end
      
      results.uniq
      
    end
    
    # Returns true if the results should be ANDed together or not.
    def should_and_results?(results1, results2, param1, param2)
      if ((param1 != 0 ) && (param2 != 0))
        true
      else
        false
      end
    end
    
    def all_search?(param1, param2)
      param1 == 'all' && param2 == 'all'
    end
    
    
    
    
  end
end