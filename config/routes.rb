Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events, only: [:index] do
        resources :medalists, only: [:index]
      end
      resources :olympian_stats, only: [:index]
      resources :olympians, only: [:index]
    end
  end
end
