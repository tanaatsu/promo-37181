Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts, only:[:index,:new,:create,:show,:edit,:update,:destroy] do
    resources :records,only:[:index,:create]
  end
  
end
