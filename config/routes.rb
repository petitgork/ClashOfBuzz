Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tournaments do
    resources :teams, only: %i[show new create]
    member do
      post :join
      patch :launch
      get :ranking_details
    end
  end
  resources :matches do
    resources :line_ups, only: %i[show new create]
    resources :team_matches, only: %i[index] do
      member do
        get :match_score
      end
    end
    member do
      patch :update_results
    end
  end
  resources :users
  resources :line_ups, only: %i[destroy]
end
