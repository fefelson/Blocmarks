Rails.application.routes.draw do


  get 'users/show'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }

  resources :users, only: [:show]

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, only: [] do
    resources :likes, only: [:create, :destroy]
  end

  resources :likes, only: [:index]


  post '/incoming' => 'incoming#create', as: 'incoming'

  root 'topics#index'

end
