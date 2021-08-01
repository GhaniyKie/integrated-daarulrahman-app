Rails.application.routes.draw do
  resources :payments do
      collection do
        post :receive_webhook
      end
    end
    # ================== SCOPE: API ======================= #
  
    # ================= devise scope ====================== #
    devise_scope :user do
      namespace :api, defaults: { format: :json } do
        post 'register', to: 'registrations#create'
        post 'login', to: 'sessions#create'
        delete 'logout', to: 'sessions#destroy'
        put 'credential', to: 'credentials#update'
      end
    end
    # ====================================================== #
  
    # =================== client scope ===================== #
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resources :students, only: [:index, :show] do
          resources :invoices, only: [:index, :show, :create]
          resources :payments, only: [:index, :show]
        end
        resources :payment_types, only: [:index, :show]
      end
    end
    # ====================================================== #
    # ================== END API SCOPE ===================== #
  
    # ================= SCOPE: SUPERUSER =================== #
    namespace :superuser do
      resources :dashboard
    end
    # ====================================================== #
  
    # =================== WEB APP SCOPE ==================== #
    
    # resource :students
    root to: 'home#index'
    # ====================================================== #
    namespace :console do
      # resources :payments
      get "payments", to: "payments#index"
      get "payments/anjay", to: "payments#anjay"
    end

    scope "/console" do
      devise_for :users
    end

    match "/404", to: "errors#not_found", via: :all

end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html