# require 'sidekiq/web'
Rails.application.routes.draw do
  # mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        member do
          post :upload_avatar
        end
      end
    end
  end

  # Swagger
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
