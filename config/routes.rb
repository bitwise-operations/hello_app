Rails.application.routes.draw do
  # get 'static_pages/home'

  get 'help' => 'static_pages#help'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'

  get 'signup' => 'users#new'

  root 'static_pages#home'

  resources :microposts
  resources :users
  # root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
end
