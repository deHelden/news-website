Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :posts do
      resources :comments
    end
  end
end
