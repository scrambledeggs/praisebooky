Rails.application.routes.draw do
  get 'voters/index'
  get 'profiles/index'
  get 'recent_activities/index'
  get 'scoreboards/index'
  get 'publics/index'
   root to: 'scoreboards#index' 
end
