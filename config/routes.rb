Rails.application.routes.draw do

	root 'homes#top'
  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }
  devise_for :admins, controllers: {
  	sessions: 'admins/sessions'
  }

  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
  resources :comments, only: [:new, :create, :edit, :update, :destroy]
  resources :genres, only: [:new, :create, :index, :edit, :update, :destroy]


  namespace :admin do
  	resources :users, only: [:index, :show, :edit, :update]
  	resources :posts, only: [:index, :edit, :update]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
