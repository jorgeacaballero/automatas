Rails.application.routes.draw do

  root 'pages#home'

  get '/dfa', to: 'dfa#index', as: :dfa
  post '/dfa/compute', to: 'dfa#compute', as: :dfa_compute
  post '/dfa/consume', to: 'dfa#consume', as: :dfa_consume
  
end
