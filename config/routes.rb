Rails.application.routes.draw do
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'logout'

  get 'faq/hello', to: 'faqs#hello'
  get 'faq/index', to: 'faqs#index'
  get 'faq/:id/comments', to: 'comments#index'

  resources :sessions, only: %i[create destroy]
end