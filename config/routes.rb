Rails.application.routes.draw do


  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  post '/incoming' => 'incoming#create', as: 'incoming'

  root 'topics#index'

end
