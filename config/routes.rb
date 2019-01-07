Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "posts#index"
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :posts do
      member do
        put :to_active
        put :to_inactive
        put :to_published
        put :to_unpublished
        put :to_archive
        put :to_rejected
      end
      resources :comments
    end
  end
end
