Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :genres
      resources :movies
      resources :characters
      resources :users, only: %i[show create update destroy]
      resources :tokens, only: %i[create]
    end
  end
  # root "articles#index"
end
