Rails.application.routes.draw do
  root 'lists#home'

  resources :lists, except: %i[edit update] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: [:destroy]

  resources :movies, only: %i[index show]

  resources :lists do
    resources :bookmarks, only: %i[create destroy]
  end
end
