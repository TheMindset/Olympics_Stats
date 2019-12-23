# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/competitors', to: 'competitors#index'
    end
  end
end
