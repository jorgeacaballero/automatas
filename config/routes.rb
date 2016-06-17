Rails.application.routes.draw do

  root 'pages#home'

  get '/dfa', to: 'dfa#index', as: :dfa
  post '/dfa/result', to: 'dfa#compute', as: :dfa_result
  
end
