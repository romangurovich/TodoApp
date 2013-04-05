TodoApp::Application.routes.draw do
  root to: "teams#index"

  resources :teams do
    resources :users, only: [:new, :create]
    resources :projects, only: [:new, :create]
  end

  resources :users do
    resources :projects, only: [:new, :create]
  end

  resources :projects do
    resources :items, only: [:new, :create]
  end

  resources :items

end
