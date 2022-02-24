Rails.application.routes.draw do

  get '/' => "homes#top"
  get 'books/index'


  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  patch 'books/:id' => 'books#update', as: 'update_book'

  resources :books


  root to: 'homes#top'






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
