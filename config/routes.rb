Rails.application.routes.draw do
  resources :goals_controllers
  devise_scope :user do
    # Redirects signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  root 'pages#index'

  devise_for :users
  resources :companies

  resources :goals do
      collection do
        get :all
      end
    end
end
