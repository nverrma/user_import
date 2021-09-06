Rails.application.routes.draw do
  root 'users#home'

  resources :users, only: [] do
    collection do
      get :home
      post :import
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
