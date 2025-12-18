Rails.application.routes.draw do
  devise_for :users
  root "community_ideas#index"
  resources :submissions, only: [:new, :create, :index]
  resources :planning_documents, only: [:index, :new, :create, :show, :destroy] do
    member do
      get :ai_summary, to: "ai_summaries#show"
    end
  end
  resources :community_ideas, only: [:index] do
    member do
      post :upvote
      post :downvote
    end
  end

  # Admin data routes
  get 'data/export_ideas', to: 'data#export_ideas'
  get 'data/analytics', to: 'data#analytics'

  namespace :admin do
    root to: "dashboard#index"
    resources :planning_documents
    resources :submissions, only: [:index] do
      member do
        patch :update_status
        patch :update_comment
        patch :toggle_flag
      end
      collection do
        patch :bulk_update
      end
    end
    get 'analytics', to: 'analytics#index'
    get 'forum', to: 'forums#index'
    get 'broadcasts', to: 'broadcasts#index'
    resources :community_ideas, only: [:index, :show, :update] do
      member do
        patch :approve
        patch :reject
      end
  end

  # WhatsApp API endpoints
  namespace :api do
    namespace :v1 do
      namespace :whatsapp do
        # Idea submission and tracking
        post 'submit_idea', to: 'ideas#create'
        get 'track/:tracking_id', to: 'ideas#track'
        get 'recent_ideas', to: 'ideas#recent'
        post 'vote', to: 'ideas#vote'

        # Notifications and subscriptions
        post 'subscribe', to: 'notifications#subscribe'
        delete 'unsubscribe', to: 'notifications#unsubscribe'
        get 'subscribers', to: 'notifications#index'
        post 'broadcast', to: 'notifications#broadcast'

        # Health check
        get 'health', to: 'health#check'
      end
    end
  end
end
