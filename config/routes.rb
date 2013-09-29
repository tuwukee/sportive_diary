SportiveDiary::Application.routes.draw do
  devise_for :parents, :class_name => 'Parent', :controllers => { :registrations => "parents/registrations", :sessions => "sessions" } do
    get   "parents/sign_up" => "parents/registrations#new", :as => :parents_signup
    delete "sessions/destroy" => "sessions#destroy", :as => :sign_out
  end

  devise_for :coaches, :class_name => 'Coach', :controllers => { :registrations => "coaches/registrations", :sessions => "sessions" } do
    get   "coaches/sign_up" => "coaches/registrations#new", :as => :coaches_signup
    delete "sessions/destroy" => "sessions#destroy", :as => :sign_out
  end

  devise_for :players, :class_name => 'Player', :controllers => { :registrations => "players/registrations", :sessions => "sessions" } do
    get   "players/sign_up" => "players/registrations#new", :as => :players_signup
    post "sessions/create" => "sessions#create", :as => :sign_in
    delete "sessions/destroy" => "sessions#destroy", :as => :sign_out
  end

  resources :players
  resources :coaches
  resources :parents
  resources :teams, :only => [:update, :create, :index]

  get "/manage_teams", :to => "coaches#manage_teams"
  root :to => 'home#home'
end
