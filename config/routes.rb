Rails.application.routes.draw do
  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'

  devise_for :users
  
  resources :users
  resources :examinations

  namespace :admin do
    root                'static_pages#home'
  end

end
