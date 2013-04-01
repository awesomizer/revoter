Votevote::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  unauthenticated do
    devise_scope :user do
     root :to => "devise/registrations#new"
    end
  end
  devise_for :users
  resources :users
end
