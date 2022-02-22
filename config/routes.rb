Rails.application.routes.draw do
  devise_scope :user do
    # Redirects signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  root 'pages#index'

  devise_for :users
  resources :companies
end
