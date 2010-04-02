require 'spec_helper'

describe SectorsController do

  def mock_sector(stubs={})
    @mock_sector ||= mock_model(Sector, stubs)
  end

  describe "GET index" do
    it "assigns all sectors as @sectors" do
      Sector.stub!(:find).with(:all).and_return([mock_sector])
      get :index
      assigns[:sectors].should == [mock_sector]
    end
  end

  describe "GET show" do
    it "assigns the requested sector as @sector" do
      Sector.stub!(:find).with("37").and_return(mock_sector)
      get :show, :id => "37"
      assigns[:sector].should equal(mock_sector)
    end
  end

  describe "GET new" do
    it "assigns a new sector as @sector" do
      Sector.stub!(:new).and_return(mock_sector)
      get :new
      assigns[:sector].should equal(mock_sector)
    end
  end

  describe "GET edit" do
    it "assigns the requested sector as @sector" do
      Sector.stub!(:find).with("37").and_return(mock_sector)
      get :edit, :id => "37"
      assigns[:sector].should equal(mock_sector)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created sector as @sector" do
        Sector.stub!(:new).with({'these' => 'params'}).and_return(mock_sector(:save => true))
        post :create, :sector => {:these => 'params'}
        assigns[:sector].should equal(mock_sector)
      end

      it "redirects to the created sector" do
        Sector.stub!(:new).and_return(mock_sector(:save => true))
        post :create, :sector => {}
        response.should redirect_to(sector_url(mock_sector))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sector as @sector" do
        Sector.stub!(:new).with({'these' => 'params'}).and_return(mock_sector(:save => false))
        post :create, :sector => {:these => 'params'}
        assigns[:sector].should equal(mock_sector)
      end

      it "re-renders the 'new' template" do
        Sector.stub!(:new).and_return(mock_sector(:save => false))
        post :create, :sector => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested sector" do
        Sector.should_receive(:find).with("37").and_return(mock_sector)
        mock_sector.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sector => {:these => 'params'}
      end

      it "assigns the requested sector as @sector" do
        Sector.stub!(:find).and_return(mock_sector(:update_attributes => true))
        put :update, :id => "1"
        assigns[:sector].should equal(mock_sector)
      end

      it "redirects to the sector" do
        Sector.stub!(:find).and_return(mock_sector(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(sector_url(mock_sector))
      end
    end

    describe "with invalid params" do
      it "updates the requested sector" do
        Sector.should_receive(:find).with("37").and_return(mock_sector)
        mock_sector.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sector => {:these => 'params'}
      end

      it "assigns the sector as @sector" do
        Sector.stub!(:find).and_return(mock_sector(:update_attributes => false))
        put :update, :id => "1"
        assigns[:sector].should equal(mock_sector)
      end

      it "re-renders the 'edit' template" do
        Sector.stub!(:find).and_return(mock_sector(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested sector" do
      Sector.should_receive(:find).with("37").and_return(mock_sector)
      mock_sector.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sectors list" do
      Sector.stub!(:find).and_return(mock_sector(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(sectors_url)
    end
  end

end
