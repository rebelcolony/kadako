require 'spec_helper'

describe TechniquesController do

  def mock_technique(stubs={})
    @mock_technique ||= mock_model(Technique, stubs)
  end

  describe "GET index" do
    it "assigns all techniques as @techniques" do
      Technique.stub!(:find).with(:all).and_return([mock_technique])
      get :index
      assigns[:techniques].should == [mock_technique]
    end
  end

  describe "GET show" do
    it "assigns the requested technique as @technique" do
      Technique.stub!(:find).with("37").and_return(mock_technique)
      get :show, :id => "37"
      assigns[:technique].should equal(mock_technique)
    end
  end

  describe "GET new" do
    it "assigns a new technique as @technique" do
      Technique.stub!(:new).and_return(mock_technique)
      get :new
      assigns[:technique].should equal(mock_technique)
    end
  end

  describe "GET edit" do
    it "assigns the requested technique as @technique" do
      Technique.stub!(:find).with("37").and_return(mock_technique)
      get :edit, :id => "37"
      assigns[:technique].should equal(mock_technique)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created technique as @technique" do
        Technique.stub!(:new).with({'these' => 'params'}).and_return(mock_technique(:save => true))
        post :create, :technique => {:these => 'params'}
        assigns[:technique].should equal(mock_technique)
      end

      it "redirects to the created technique" do
        Technique.stub!(:new).and_return(mock_technique(:save => true))
        post :create, :technique => {}
        response.should redirect_to(technique_url(mock_technique))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved technique as @technique" do
        Technique.stub!(:new).with({'these' => 'params'}).and_return(mock_technique(:save => false))
        post :create, :technique => {:these => 'params'}
        assigns[:technique].should equal(mock_technique)
      end

      it "re-renders the 'new' template" do
        Technique.stub!(:new).and_return(mock_technique(:save => false))
        post :create, :technique => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested technique" do
        Technique.should_receive(:find).with("37").and_return(mock_technique)
        mock_technique.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :technique => {:these => 'params'}
      end

      it "assigns the requested technique as @technique" do
        Technique.stub!(:find).and_return(mock_technique(:update_attributes => true))
        put :update, :id => "1"
        assigns[:technique].should equal(mock_technique)
      end

      it "redirects to the technique" do
        Technique.stub!(:find).and_return(mock_technique(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(technique_url(mock_technique))
      end
    end

    describe "with invalid params" do
      it "updates the requested technique" do
        Technique.should_receive(:find).with("37").and_return(mock_technique)
        mock_technique.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :technique => {:these => 'params'}
      end

      it "assigns the technique as @technique" do
        Technique.stub!(:find).and_return(mock_technique(:update_attributes => false))
        put :update, :id => "1"
        assigns[:technique].should equal(mock_technique)
      end

      it "re-renders the 'edit' template" do
        Technique.stub!(:find).and_return(mock_technique(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested technique" do
      Technique.should_receive(:find).with("37").and_return(mock_technique)
      mock_technique.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the techniques list" do
      Technique.stub!(:find).and_return(mock_technique(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(techniques_url)
    end
  end

end
