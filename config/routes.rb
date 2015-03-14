Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  namespace :api, defaults: {format: 'json'} do

    namespace :v1 do
      resources :users, :only => [:index, :create, :show, :update]
    end

  end
end
