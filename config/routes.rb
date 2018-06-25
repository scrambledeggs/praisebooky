Rails.application.routes.draw do
  get 'votes/index'
  get 'profiles/index'
  get 'recent_activities/index'
  get 'scoreboards/index'
  get '/scoreboards/tech'
  get '/scoreboards/businessdev'
  get '/scoreboards/marketing'
  get '/scoreboards/operations'

    root to: 'scoreboards#index' 

    resources :votes 


    resources :users do
    	resources :departments
    end
end