class HomeController < ApplicationController
  def index
    @recent_votes = Vote.get_recent_votes('senate')
  end
end
