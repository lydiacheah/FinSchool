Rails.application.routes.draw do
  root 'users#home'

  # Omniauth Routes
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  resources :users, only: [:show, :edit, :update, :destroy] 

  get "/home" => "users#home", as: "home"
  
  # Clearance routes
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/start" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  
  # Games routes
  resources :games, only: [:show, :index]
end
