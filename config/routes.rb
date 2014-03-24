Ishetaltijd::Application.routes.draw do
  resources :timer

  root to: 'timer#index'
end
