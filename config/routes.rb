Scorecards::Application.routes.draw do
#  root :to=>'clubs#index' #Must remove the default root page -> rm public/index.html
  root :to=>'scorecards#index' #Must remove the default root page -> rm public/index.html

  resources :users, :except => [:index, :destroy]
  resources :scorecards
  
  resources :clubs do
    resources :courses do
      resources :holes
    end
  end

  match 'authentication' => 'authentication#index'
  match 'authentication/login' => 'authentication#login'
  match 'authentication/logout' => 'authentication#logout'
  
end
