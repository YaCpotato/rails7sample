Rails.application.routes.draw do
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'logout'

  get 'faq/hello', to: 'faqs#hello'

  get 'newspaper/index', to: 'newspapers#index'

  resources :sessions, only: %i[create destroy]
end