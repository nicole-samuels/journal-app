Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  root 'patterns#index'
#  resources :patterns, only: [:create, :new, :destroy, :show, :edit, :update]

resources :patterns do
    # 1. Collection routes (No ID needed)
    collection do
      get :search
      post :import
    end

    # 2. Nested routes (Requires a pattern ID)
    resources :projects
  end
end
