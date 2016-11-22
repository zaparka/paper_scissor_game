Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :rock_paper_scissors, only: [:create]
    end
  end
end
