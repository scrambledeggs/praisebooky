Rails.application.routes.draw do
  get 'votes/index'
  get 'votes/form'
  get 'profiles/index'
  get 'recent_activities/index'
  get 'scoreboards/index'
  get 'publics/index'
    root to: 'scoreboards#index' 

    resources :votes 

end