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

  get 'users/:id/amps', to: 'amps#index'
  get 'users/:id/amps/:id', to: 'amps#show'

end
