SportiveDiary::Application.routes.draw do

  devise_for :parents, :class_name => 'Parent', :controllers => { :registrations => "parents/registrations", :sessions => "sessions" } do
    get   "parents/sign_up" => "players/registrations#new", :as => :parents_signup
    delete "sessions/destroy" => "sessions#destroy", :as => :sign_out
  end

  devise_for :couches, :class_name => 'Couch', :controllers => { :registrations => "couches/registrations", :sessions => "sessions" } do
    get   "couches/sign_up" => "couches/registrations#new", :as => :couches_signup
    delete "sessions/destroy" => "sessions#destroy", :as => :sign_out
  end

  devise_for :players, :class_name => 'Player', :controllers => { :registrations => "players/registrations", :sessions => "sessions" } do
    get   "players/sign_up" => "players/registrations#new", :as => :players_signup
    post "sessions/create" => "sessions#create", :as => :sign_in
    delete "sessions/destroy" => "sessions#destroy", :as => :sign_out
  end

  resources :players
  resources :couches
  resources :parents

  root :to => 'static#home'
end
