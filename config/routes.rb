Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config.merge({
    controllers: {sessions: 'users/sessions'}, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    }
   } )
  resources :upcoming_events do
    member do
      put 'goingpeople'
      put 'coming_with_person'
    end
    collection do
      get  'past_events'
      get 'upcomings'
      get 'live_events'
    end

  end
  resources :sermons do
    resources :sermonreviews
  end
  resources :images
  resources :news
  resources :contacts, only: [:new, :create]
  get 'pages/filter/:scope' => 'pages#index', as: :filtered_page
  # resources :imagegalleries
   root to: 'home#index'
  resources :posts, :pictures, :aboutpages, shallow: true do
    resources :pictures
    member do
      post 'like'
      delete 'unlike'
    end
    resources :comments do
      member do
        post 'like'
        delete 'unlike'
      end
      resources :replies
    end
  end
end
