Rails.application.routes.draw do
  get 'votes/index'
  get 'votes/form'
  get 'profiles/index'
  get 'recent_activities/index'
  get 'scoreboards/index'
  get 'publics/index'

  get '/votes/:receiver' => 'votes#new'

    root to: 'scoreboards#index' 

    resources :votes 

end