Rails.application.routes.draw do
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'logout'

  get 'faq/hello', to: 'faqs#hello'

  get 'article/index', to: 'articles#index'
  get 'article/extra_news_send/:id', to: 'articles#extra_news_send', as: 'article_extra_news_send'

  resources :sessions, only: %i[create destroy]
  resources :users
  resources :articles
end