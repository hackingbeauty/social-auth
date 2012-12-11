SlimScale::Application.routes.draw do
  get "users/show"

  get "authentications/create"

  get "authentications/index"

  get "authentications/destroy"

  resources :authentications
  
  match 'post-weight' => 'weights#create'
  
  match '/auth/:provider/callback' => 'authentications#create'
  match '/auth/failure' => 'sessions#failure'
  match 'sign_out' => 'sessions#destroy'
  match 'lookup' => "weights#lookup"
  
  get "pages/home"
  

  root :to => "pages#home"
end
