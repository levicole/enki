require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::HealthController do
  describe 'handling GET to index' do
    before(:each) do
      login_as("quentin")
      get :index
    end

    it "is successful" do
      response.should be_success
    end

    it "renders health template" do
      response.should render_template("index")
    end
  end

  describe 'handling POST to exception' do
    describe 'when logged in' do
      it 'raises a RuntimeError' do
        login_as("quentin")
        lambda {
          post :exception
        }.should raise_error
      end
    end

    describe 'when not logged in' do
      it 'does no raise' do
        lambda {
          post :exception
        }.should_not raise_error
      end
    end
  end

  describe 'handling GET to exception' do
    it '405s' do
      login_as("quentin")
      get :exception
      response.status.should == '405 Method Not Allowed'
      response.headers['Allow'].should == 'POST'
    end
  end
end
