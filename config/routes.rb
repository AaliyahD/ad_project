#rake routes in Gitbash to see the URL pattern

Rails.application.routes.draw do


devise_for :users, :controllers => { sessions: 'sessions' , registrations: 'registrations'}
devise_scope :user do
  #root to: "devise/sessions#new"
  root to: "posts#index"

get '/login' => 'admin/sessions#new'
get '/logout' => 'admin/sessions#destroy'
get 'users/:id' => 'users#show'

  namespace :admin do

    resources :posts
    resources :users, only: [:index, :destroy]
    resources :settings, only: [:new, :create, :edit, :update]
    resources :dashboard, only: [:index]
    resources :notifications, only: [:index, :destroy]
    resources :messages
    resources :visitors, only: [:index, :destroy]
    resources :comments, only:[:index, :update, :destroy]
    resources :tags
    resources :sessions, only: [:new, :create, :destroy]
    #to restrict from deletein admin , you specify only v
    resources :administrators, only: [:index, :edit, :update]
    resources :diarylogs, only: [:index, :show, :edit, :update]
  end

  
  resources :messages
  resources :settings 
  resources :users, only: [:index, :show]
  resources :diarylogs 
  resources :help
  resources :fitabout
   resources :previewdiary
  resources :posts do
  resources :comments 
  end
  resources :comments 
  end
  match 'dismiss_all_notifications', to: 'admin/notifications#delete_all', via: :delete
end

