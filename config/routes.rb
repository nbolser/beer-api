Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post :auth, to: 'authentication#create'
      resources :users
      resources :beers
    end
  end
end
