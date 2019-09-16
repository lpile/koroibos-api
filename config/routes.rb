Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events, only: [:index]
      resources :olympian_stats, only: [:index]
      resources :olympians, only: [:index]
    end
  end
end
