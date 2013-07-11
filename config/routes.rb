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
  get '/bill', to: 'bills#find', as: :bill_find
  get '/bill/:id', to: 'bills#show', as: :bill
  get '/vote/:id', to: 'votes#show', as: :vote
end
