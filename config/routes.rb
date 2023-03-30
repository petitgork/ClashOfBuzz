Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tournaments do
    resources :teams, only: %i[show new create]
    member do
      post :join
      patch :launch
    end
  end
  resources :matches do
    resources :line_ups, only: %i[show new create]
  end
  resources :users
  resources :line_ups, only: %i[destroy]
end
