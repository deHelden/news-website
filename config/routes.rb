Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "posts#index"
  # error pages
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :posts do
      resources :comments
      collection do
        get 'feed'#, :constraints => {:format => :rss}
      end
    end
  end
end
