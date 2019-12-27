# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/competitors', to: 'competitors#index'
      get '/competitors_stats', to: 'competitors_stats#index'
    end
  end
end
