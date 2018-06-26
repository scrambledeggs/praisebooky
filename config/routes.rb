Rails.application.routes.draw do
  get 'votes/index'
  get 'votes/form'
  get 'profiles/index'
  get 'recent_activities/index'
  get 'scoreboards/index'
  get '/scoreboards/tech'
  get '/scoreboards/businessdev'
  get '/scoreboards/marketing'
  get '/scoreboards/operations'
  get 'publics/index'

  get '/votes/:receiver' => 'votes#new'
    root to: 'scoreboards#index' 
  
    resources :votes 

    resources :users do
    	resources :departments
    end
end