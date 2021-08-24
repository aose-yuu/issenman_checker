Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get 'result', to: 'home#result'

  get 'admin/add/word/page/new', to: 'words#new'
  post 'admin/add/word/page/create', to: 'words#create'
  delete 'admin/add/word/page/:id/destroy', to: 'words#destroy'
  get 'admin/add/word/page/login', to: 'words#login'
  post 'admin/add/word/page/signin', to: 'words#signin'
  post 'admin/add/word/page/logout', to: 'words#logout'
  get 'admin/add/word/page', to: 'words#index'
end
