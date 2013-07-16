require 'spec_helper'

describe VotesController do

  context 'GET #show' do

    it 'assigns vote information to @vote' do
      vote = FactoryGirl.create(:vote)
      get :show, {id: vote.id}
      assigns(:vote).should eq(vote)
    end

    it 'renders the show view' do
      vote = FactoryGirl.create(:vote)
      get :show, {id: vote.id}
      response.should render_template(:show)
    end

  end
end
