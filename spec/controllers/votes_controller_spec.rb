require 'spec_helper'

describe VotesController do

  context 'GET #show' do

    # not sure how to mock the call to State.XX

    it 'assigns vote information to @vote' do
      vote = FactoryGirl.create(:vote)
      get :show, {id: vote.id}
      assigns(:vote).should eq(vote)
    end

    it 'assigns vote information to @popular_vote' do
      vote = FactoryGirl.create(:vote)
      popular_vote, popular_tally = Vote.fractional_vote(vote.voters, :population, vote.required)
      get :show, {id: vote.id}
      assigns(:popular_vote).should eq(popular_vote)
    end

    it 'assigns vote information to @popular_tally' do
      vote = FactoryGirl.create(:vote)
      popular_vote, popular_tally = Vote.fractional_vote(vote.voters, :population, vote.required)
      get :show, {id: vote.id}
      assigns(:popular_tally).should eq(popular_vote)
    end

    it 'assigns vote information to @fractional_vote' do
      vote = FactoryGirl.create(:vote)
      fractional_vote, fractional_tally = Vote.fractional_vote(vote.voters, :population, vote.required)
      get :show, {id: vote.id}
      assigns(:fractional_vote).should eq(fractional_vote)
    end

    it 'assigns vote information to @fractional_tally' do
      vote = FactoryGirl.create(:vote)
      fractional_vote, fractional_tally = Vote.fractional_vote(vote.voters, :population, vote.required)
      get :show, {id: vote.id}
      assigns(:fractional_tally).should eq(fractional_vote)
    end

    it 'assigns vote information to @seniority_vote' do
      vote = FactoryGirl.create(:vote)
      seniority_vote, seniority_tally = Vote.integer_vote(vote.voters, :population, vote.required)
      get :show, {id: vote.id}
      assigns(:seniority_vote).should eq(seniority_vote)
    end

    it 'assigns vote information to @seniority_tally' do
      vote = FactoryGirl.create(:vote)
      seniority_vote, seniority_tally = Vote.integer_vote(vote.voters, :population, vote.required)
      get :show, {id: vote.id}
      assigns(:seniority_tally).should eq(seniority_vote)
    end

    it 'renders the show view' do
      vote = FactoryGirl.create(:vote)
      get :show, {id: vote.id}
      response.should render_template(:show)
    end

  end
end
