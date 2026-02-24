Rails.application.routes.draw do
  resources :posts
  resources :topics
  # Health check endpoint for load balancers
  get "/up", to: "health#up", as: :health_check

  if Rails.env.development?
    resource :example
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  # Separate admin login using Devise scope
  # This creates /admin/login, /admin/logout, etc. for admin-only sessions
  devise_scope :user do
    get "/admin/login", to: "devise/sessions#new", as: :new_admin_session
    post "/admin/login", to: "devise/sessions#create", as: :admin_session
    delete "/admin/logout", to: "devise/sessions#destroy", as: :destroy_admin_session
  end

  # Profile routes
  get "profile", to: "users#dashboard", as: :profile
  get "profile/edit", to: "users#edit", as: :edit_profile

  # Two-factor authentication routes
  resource :two_factor_authentication, only: [ :show, :create, :destroy ]

  # User profile routes
  resource :user, only: [ :show, :edit, :update ] do
    get :dashboard, on: :member
  end

  # Landing pages
  get "landing", to: "pages#landing"
  root to: "pages#landing", as: "citizen_landing"

  # Admin landing page
  get "/admin", to: "admin/landing#index", as: "admin_landing"

  # Submissions
  resources :submissions, only: [ :new, :create, :index ]

  # Planning documents
  resources :planning_documents, only: [ :index, :new, :create, :show, :destroy ] do
    member do
      get :ai_summary, to: "ai_summaries#show"
    end
  end

  # Community ideas
  resources :community_ideas, only: [ :index, :show ] do
    member do
      post :upvote
      post :downvote
    end
    resources :comments, only: [ :create, :edit, :update, :destroy ]
  end

  # Ideas explorer

  # Data routes
  get "data/export_ideas", to: "data#export_ideas"
  get "data/analytics", to: "data#analytics"

  # Admin namespace
  namespace :admin do
    root to: "dashboard#index"
    get "dashboard", to: "dashboard#index"
    get "app_preview", to: "app_preview#index"
    get "analytics", to: "analytics#index"
    get "forum", to: "forums#index"
    resources :topics do
      resources :posts
    end
    get "broadcasts", to: "broadcasts#index"

    resources :planning_documents
    resources :submissions, only: [ :index ] do
      member do
        patch :update_status
        patch :update_comment
        patch :toggle_flag
      end
      collection do
        patch :bulk_update
      end
    end

    resources :community_ideas, only: [ :index, :show, :update ] do
      member do
        patch :approve
        patch :reject
      end
    end

    resources :users, only: [ :index, :show, :edit, :update, :destroy ] do
      member do
        patch :toggle_admin
      end
    end

    resources :broadcasts
  end

  # API namespace
  namespace :api do
    namespace :v1 do
      resources :community_ideas, only: [ :index, :show ]
    end
  end

  # Root route - serve the landing page as site root
  root to: "pages#landing"
end
