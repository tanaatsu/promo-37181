Rails.application.routes.draw do
  'users#show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    }
  root to: "posts#index"
  resources :posts, only:[:index,:new,:create,:show,:edit,:update,:destroy] do
    resources :records,only:[:index,:create]
    resources :comments,only: [:create]
  end
  resources :users ,only: [:show]
end
