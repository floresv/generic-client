Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post  'login', to: 'users#login'
  resources :products, only: %i(index show create update destroy)
end
