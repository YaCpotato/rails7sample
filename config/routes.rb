Rails.application.routes.draw do
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'logout'

  get 'faq/hello', to: 'faqs#hello'

  get 'newspaper/index', to: 'newspapers#index'
  get 'newspaper/extra_news_send/:id', to: 'newspapers#extra_news_send', as: 'newspaper_extra_news_send'

  resources :sessions, only: %i[create destroy]
  resources :users
end