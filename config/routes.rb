Rails.application.routes.draw do
  scope :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'custom/registrations',
        sessions: 'custom/sessions',
        passwords: 'custom/passwords',
        token_validations: 'custom/token_validations',
        omniauth_callbacks: 'custom/omniauth_callbacks'
    }

    resources :events, only: [:index, :show] do
      get '/participant_events', to: 'events#participant_events', on: :collection
      put '/accept_event/:id', to: 'events#accept_event', on: :member
    end
    resources :groups, only: [:index, :show] do
      get '/user_groups', to: 'groups#user_groups', on: :collection
    end
    resources :users, only: [:show, :update] do
      resources :events, only: [:create, :destroy, :update]
      resources :groups, only: [:create, :destroy, :update]
    end
  end
end
