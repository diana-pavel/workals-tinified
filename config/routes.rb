Rails.application.routes.draw do
  resources :goals_controllers
  devise_scope :user do
    # Redirects signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  root 'pages#index'

  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
    end

   post "password/forgot", to: "passwords#forgot"

  resources :companies

  resources :goals do
      collection do
        get :all
      end
    end
end
