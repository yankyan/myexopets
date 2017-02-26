Rails.application.routes.draw do

  resources :molts
  resources :feeds
  resources :pets
  devise_for :users
root 'pages#landing'
get 'pages/about'
  get '/pets/:id/feed' => 'feeds#new', as: "pets_feeding"
  get '/pets/:id/molt' => 'molts#new', as: "pets_molting"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
