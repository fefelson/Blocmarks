Rails.application.routes.draw do


  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  root 'topics#index'

end
