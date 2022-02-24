Rails.application.routes.draw do
  devise_scope :user do
    # Redirects signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  root 'pages#index'
  get '/companies', to: 'pages#comp', as: 'companies'

  devise_for :users
 devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
    end

  resources :companies

  resources :goals do
      collection do
        get :all
      end
    end
end
