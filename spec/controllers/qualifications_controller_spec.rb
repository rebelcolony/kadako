require 'spec_helper'

describe QualificationsController do

  def mock_qualification(stubs={})
    @mock_qualification ||= mock_model(Qualification, stubs)
  end

  describe "GET index" do
    it "assigns all qualifications as @qualifications" do
      Qualification.stub!(:find).with(:all).and_return([mock_qualification])
      get :index
      assigns[:qualifications].should == [mock_qualification]
    end
  end

  describe "GET show" do
    it "assigns the requested qualification as @qualification" do
      Qualification.stub!(:find).with("37").and_return(mock_qualification)
      get :show, :id => "37"
      assigns[:qualification].should equal(mock_qualification)
    end
  end

  describe "GET new" do
    it "assigns a new qualification as @qualification" do
      Qualification.stub!(:new).and_return(mock_qualification)
      get :new
      assigns[:qualification].should equal(mock_qualification)
    end
  end

  describe "GET edit" do
    it "assigns the requested qualification as @qualification" do
      Qualification.stub!(:find).with("37").and_return(mock_qualification)
      get :edit, :id => "37"
      assigns[:qualification].should equal(mock_qualification)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created qualification as @qualification" do
        Qualification.stub!(:new).with({'these' => 'params'}).and_return(mock_qualification(:save => true))
        post :create, :qualification => {:these => 'params'}
        assigns[:qualification].should equal(mock_qualification)
      end

      it "redirects to the created qualification" do
        Qualification.stub!(:new).and_return(mock_qualification(:save => true))
        post :create, :qualification => {}
        response.should redirect_to(qualification_url(mock_qualification))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved qualification as @qualification" do
        Qualification.stub!(:new).with({'these' => 'params'}).and_return(mock_qualification(:save => false))
        post :create, :qualification => {:these => 'params'}
        assigns[:qualification].should equal(mock_qualification)
      end

      it "re-renders the 'new' template" do
        Qualification.stub!(:new).and_return(mock_qualification(:save => false))
        post :create, :qualification => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested qualification" do
        Qualification.should_receive(:find).with("37").and_return(mock_qualification)
        mock_qualification.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :qualification => {:these => 'params'}
      end

      it "assigns the requested qualification as @qualification" do
        Qualification.stub!(:find).and_return(mock_qualification(:update_attributes => true))
        put :update, :id => "1"
        assigns[:qualification].should equal(mock_qualification)
      end

      it "redirects to the qualification" do
        Qualification.stub!(:find).and_return(mock_qualification(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(qualification_url(mock_qualification))
      end
    end

    describe "with invalid params" do
      it "updates the requested qualification" do
        Qualification.should_receive(:find).with("37").and_return(mock_qualification)
        mock_qualification.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :qualification => {:these => 'params'}
      end

      it "assigns the qualification as @qualification" do
        Qualification.stub!(:find).and_return(mock_qualification(:update_attributes => false))
        put :update, :id => "1"
        assigns[:qualification].should equal(mock_qualification)
      end

      it "re-renders the 'edit' template" do
        Qualification.stub!(:find).and_return(mock_qualification(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested qualification" do
      Qualification.should_receive(:find).with("37").and_return(mock_qualification)
      mock_qualification.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the qualifications list" do
      Qualification.stub!(:find).and_return(mock_qualification(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(qualifications_url)
    end
  end

end
