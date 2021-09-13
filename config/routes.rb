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
  root to: 'home#index'
  get 'claim_profile', to: 'after_register#claim_profile'
  put 'claim_profile', to: 'after_register#connect_account_with_profile'
  # ====================================================== #
  namespace :console do
    namespace :division do
      get "exchequers", to: "exchequers#index"
    end
    namespace :student do
      get "payments", to: "payments#index"
    end
  end

  devise_for :users, skip: [:sessions, :registration]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session

    get 'register', to: 'users/registrations#new', as: :new_user_registration
    post 'register', to: 'users/registrations#create', as: :create_user_registration
    get 'register/cancel', to: 'users/registrations#cancel', as: :cancel_user_registration
    get 'credential', to: 'users/registrations#edit', as: :edit_user_registration
    put 'credential', to: 'users/registrations#update', as: :update_user_registration
    delete 'credential', to: 'users/registrations#destroy', as: :delete_user_registration
  end

  match "/404", to: "errors#not_found", via: :all

end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html