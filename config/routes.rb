Rails.application.routes.draw do
  devise_for :users
  resources :surveys, only: :edit
  root to: 'pages#home'
  resources :events, only:[:index, :show, :new, :create] do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get"surveys/preferences", to: "events#preferences", as: "preferences"
    resources :guests do
      get"guests/confirmation", to: "surveys#confirmation", as: "confirmation"
      resources :surveys, except: :edit
    end
  end
  #error pages
  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#server_error"

end
