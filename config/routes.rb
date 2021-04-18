Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  devise_scope :user do
    namespace :api, defaults: { format: :json } do
      post 'register', to: 'registrations#create'
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
      put 'credential', to: 'credentials#update'
    end
  end

  namespace :admin do
    resources :dashboards
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :students, only: [:index, :show] do
        resources :invoices, only: [:index, :show, :create]
        resources :payments, only: [:index, :show]
      end
      resources :payment_types, only: [:index, :show]
    end
  end

  resource :students

  # TODO:
  # # Catch-all to allow proper HTTP responses for 405 and 501
  # match "*route_not_found.:format", :to => "application#route_not_found"
  # match "*route_not_found",         :to => "application#route_not_found"

end
