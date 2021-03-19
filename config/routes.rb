Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events, only:[:index, :show, :new, :create] do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   get"guests/confirmation", to: "surveys#confirmation", as: "confirmation"
    get"surveys/preferences", to: "events#preferences", as: "preferences"
    resources :guests do

        resources :surveys
   end
 end
end
