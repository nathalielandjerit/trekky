Trekky::Application.routes.draw do

  resources :travels do
    resources :activities do
      resources :comments
      resources :pictures
    end
  end

  resources :pictures
  
  resources :home do
    collection do
      match 'search' => 'home#search', :via => [:get, :post], :as  => :search
    end
  end

  devise_for :users
  resources :users, :only => [:show]


  #match '/users/edit' => "devise/sessions#new", as: :user_root
  match '/users/:id' => 'users#show', as: :user_root

  authenticated :user do
    root to: 'users#show'
  end

  root to: 'home#index'
end
