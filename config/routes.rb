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
  
  # controller matchers
  get '/bill', to: 'bills#find', as: :find_bill
  get '/bills/:id', to: 'bills#show', as: :bill
  get '/votes/:id', to: 'votes#show', as: :vote
  get '/vote', to: 'votes#find', as: :find_vote
end
