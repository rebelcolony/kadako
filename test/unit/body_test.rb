require 'test_helper' 

class BodyTest < ActiveSupport::TestCase
   # Replace this with your real tests.  
   def test_truth
      assert true
   end
   
   def test_should_not_save_body_without_title 
     body = Body.new 
     assert !body.save, "saved without title"
   end 
end 