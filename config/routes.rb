Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :compositions do
      resources :writings
  end

  resources :writings do
      resources :corrections
  end

  namespace :account do
    resources :compositions, :writings, :corrections
  end

  namespace :account do
    resources :users
  end

  namespace :admin do
    resources :compositions, :writings, :corrections
  end

  namespace :wrpigai do
   resources :compositions, :writings

  end

  resources :images, only: [:create, :destroy]
  root 'welcome#index'


end
