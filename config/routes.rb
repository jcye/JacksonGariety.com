JacksongarietyDev::Application.routes.draw do
  # Active Admin

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  mount Ckeditor::Engine => '/ckeditor'

  # Pages

  root :to => "home#index"

  match "/home" => redirect("/#")

  match "/journals" => redirect("/#journals")

  match "/photography" => redirect("/#photography")

  match "/thoughts" => redirect("/#thoughts")

  match "/projects" => redirect("/#projects")

  match '/resume' => "pages#resume"
  
  match '/contact' => "pages#resume"
  
  match '/about' => "pages#resume"

  match '/feeds' => "pages#feeds"
  
  match '/goals' => "pages#goals"

  # RSS feeds

  match '/feeds/literary' => 'posts#index', :as => :feed, :defaults => { :format => 'atom' }

  match '/feeds/architect' => 'home#architect', :as => :feed, :defaults => { :format => 'atom' }

  match '/feed' => 'home#architect', :as => :feed, :defaults => { :format => 'atom' }

  match '/feed.rss' => 'home#architect', :as => :feed, :defaults => { :format => 'atom' }

  match '/feeds/stalker' => 'home#index', :as => :feed, :defaults => { :format => 'atom' }

  # Models

  resources :projects

  resources :events

  resources :photographs, :path => "photography"

  resources :quotes, :path => "thoughts"

  resources :videos

  resources :posts, :path => "journals"

  # Methods

  match "like", :to => "posts#like"
end
