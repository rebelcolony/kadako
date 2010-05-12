require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BodiesController do

  def mock_body(stubs={})
    @mock_body ||= mock_model(Body, stubs)
  end

  describe "GET index" do
    it "assigns all bodies as @bodies" do
      Body.stub!(:find).with(:all).and_return([mock_body])
      get :index
      assigns[:bodies].should == [mock_body]
    end
  end


  describe "GET new" do
    it "assigns a new body as @body" do
      Body.stub!(:new).and_return(mock_body)
      get :new
      assigns[:body].should equal(mock_body)
    end
  end

  describe "GET edit" do
    it "assigns the requested body as @body" do
      Body.stub!(:find).with("37").and_return(mock_body)
      get :edit, :id => "37"
      assigns[:body].should equal(mock_body)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created body as @body" do
        Body.stub!(:new).with({'these' => 'params'}).and_return(mock_body(:save => true))
        post :create, :body => {:these => 'params'}
        assigns[:body].should equal(mock_body)
      end

      it "redirects to the created body" do
        Body.stub!(:new).and_return(mock_body(:save => true))
        post :create, :body => {}
        response.should redirect_to(body_url(mock_body))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved body as @body" do
        Body.stub!(:new).with({'these' => 'params'}).and_return(mock_body(:save => false))
        post :create, :body => {:these => 'params'}
        assigns[:body].should equal(mock_body)
      end

      it "re-renders the 'new' template" do
        Body.stub!(:new).and_return(mock_body(:save => false))
        post :create, :body => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested body" do
        Body.should_receive(:find).with("37").and_return(mock_body)
        mock_body.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :body => {:these => 'params'}
      end

      it "assigns the requested body as @body" do
        Body.stub!(:find).and_return(mock_body(:update_attributes => true))
        put :update, :id => "1"
        assigns[:body].should equal(mock_body)
      end

      it "redirects to the body" do
        Body.stub!(:find).and_return(mock_body(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(body_url(mock_body))
      end
    end

    describe "with invalid params" do
      it "updates the requested body" do
        Body.should_receive(:find).with("37").and_return(mock_body)
        mock_body.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :body => {:these => 'params'}
      end

      it "assigns the body as @body" do
        Body.stub!(:find).and_return(mock_body(:update_attributes => false))
        put :update, :id => "1"
        assigns[:body].should equal(mock_body)
      end

      it "re-renders the 'edit' template" do
        Body.stub!(:find).and_return(mock_body(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested body" do
      Body.should_receive(:find).with("37").and_return(mock_body)
      mock_body.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the bodies list" do
      Body.stub!(:find).and_return(mock_body(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(bodies_url)
    end
  end

end
