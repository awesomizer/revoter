Votevote::Application.routes.draw do
  unauthenticated :user do
    root :to => 'home#index'
  end
#  unauthenticated do
    #devise_scope :user do
     #root :to => "devise/registrations#new"
    #end
  #end
  devise_for :users
  resources :users
  
  # congress_api matchers
  get '/congress_api/bill', to: 'congress_api#bill', as: :bill
end
