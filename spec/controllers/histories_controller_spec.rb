require 'spec_helper'

describe HistoriesController do

  def mock_history(stubs={})
    @mock_history ||= mock_model(History, stubs)
  end

  describe "GET index" do
    it "assigns all histories as @histories" do
      History.stub!(:find).with(:all).and_return([mock_history])
      get :index
      assigns[:histories].should == [mock_history]
    end
  end

  describe "GET show" do
    it "assigns the requested history as @history" do
      History.stub!(:find).with("37").and_return(mock_history)
      get :show, :id => "37"
      assigns[:history].should equal(mock_history)
    end
  end

  describe "GET new" do
    it "assigns a new history as @history" do
      History.stub!(:new).and_return(mock_history)
      get :new
      assigns[:history].should equal(mock_history)
    end
  end

  describe "GET edit" do
    it "assigns the requested history as @history" do
      History.stub!(:find).with("37").and_return(mock_history)
      get :edit, :id => "37"
      assigns[:history].should equal(mock_history)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created history as @history" do
        History.stub!(:new).with({'these' => 'params'}).and_return(mock_history(:save => true))
        post :create, :history => {:these => 'params'}
        assigns[:history].should equal(mock_history)
      end

      it "redirects to the created history" do
        History.stub!(:new).and_return(mock_history(:save => true))
        post :create, :history => {}
        response.should redirect_to(history_url(mock_history))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved history as @history" do
        History.stub!(:new).with({'these' => 'params'}).and_return(mock_history(:save => false))
        post :create, :history => {:these => 'params'}
        assigns[:history].should equal(mock_history)
      end

      it "re-renders the 'new' template" do
        History.stub!(:new).and_return(mock_history(:save => false))
        post :create, :history => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested history" do
        History.should_receive(:find).with("37").and_return(mock_history)
        mock_history.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :history => {:these => 'params'}
      end

      it "assigns the requested history as @history" do
        History.stub!(:find).and_return(mock_history(:update_attributes => true))
        put :update, :id => "1"
        assigns[:history].should equal(mock_history)
      end

      it "redirects to the history" do
        History.stub!(:find).and_return(mock_history(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(history_url(mock_history))
      end
    end

    describe "with invalid params" do
      it "updates the requested history" do
        History.should_receive(:find).with("37").and_return(mock_history)
        mock_history.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :history => {:these => 'params'}
      end

      it "assigns the history as @history" do
        History.stub!(:find).and_return(mock_history(:update_attributes => false))
        put :update, :id => "1"
        assigns[:history].should equal(mock_history)
      end

      it "re-renders the 'edit' template" do
        History.stub!(:find).and_return(mock_history(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested history" do
      History.should_receive(:find).with("37").and_return(mock_history)
      mock_history.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the histories list" do
      History.stub!(:find).and_return(mock_history(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(histories_url)
    end
  end

end
