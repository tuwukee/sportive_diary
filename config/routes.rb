SportiveDiary::Application.routes.draw do

  devise_for :parents, :class_name => 'Parent', :controllers => { :registrations => "parents/registrations" } do
    get   "parents/sign_up" => "players/registrations#new", :as => :parents_signup
    #get   "players/sign_in" => "players/sess#index", :as => :player_signin
  end

  devise_for :couches, :class_name => 'Couch', :controllers => { :registrations => "couches/registrations" } do
    get   "couches/sign_up" => "couches/registrations#new", :as => :couches_signup
    #get   "players/sign_in" => "players/sess#index", :as => :player_signin
  end

  devise_for :players, :class_name => 'Player', :controllers => { :registrations => "players/registrations" } do
    get   "players/sign_up" => "players/registrations#new", :as => :players_signup
    #get   "players/sign_in" => "players/sess#index", :as => :player_signin
  end

  resources :players
  resources :couches
  resources :parents
end
