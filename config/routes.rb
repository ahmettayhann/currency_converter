Rails.application.routes.draw do
  root 'currencies#index'
  resources :currency_pairs
  resources :currencies do
    get :get_current_rates, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
