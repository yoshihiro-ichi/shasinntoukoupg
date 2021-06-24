Rails.application.routes.draw do
 resources :sessions, only: [:new, :create, :destroy]
 resources :users, only: [:new, :create,:show,:edit,:destroy,:update]
 resources :favorites, only: [:create, :destroy,:index]
 resources :pictures do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

 root 'users#new'
end
