# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'amps#index'
  namespace :api do
    namespace :v1 do
      get 'amps/fetch'
    end
  end

  resources :users do
    resources :amps, only: %i[index show]
  end
end
