Rails.application.routes.draw do

  devise_for :users

  root to: "homes#top"

  resources :users, only: [:show, :index, :edit]

  resources :schedules, only: [:index, :new, :create, :show, :edit, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
