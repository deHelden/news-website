Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  devise_for :user, path:'/'

  authenticate :user do
    scope "/admin" do
      devise_for :admin_user, ActiveAdmin::Devise.config
      ActiveAdmin.routes(self)
    end
  end
  root to: 'posts#index'
  # error pages
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  get '/categories/:id', to: 'categories#show', as: 'category'

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :posts do
      collection do
        get :autocomplete
      end
      resources :comments
      collection do
        get 'feed'
      end
    end
  end
end
