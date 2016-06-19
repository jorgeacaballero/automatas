Rails.application.routes.draw do

    root 'pages#home'

    get '/dfa', to: 'dfa#index', as: :dfa
    post '/dfa/compute', to: 'dfa#compute', as: :dfa_compute
    post '/dfa/consume', to: 'dfa#consume', as: :dfa_consume

    get '/pda', to: 'pda#index', as: :pda
    post '/pda/compute', to: 'pda#compute', as: :pda_compute
    post '/pda/consume', to: 'pda#consume', as: :pda_consume

    get '/tm', to: 'tm#index', as: :tm
    post '/tm/compute', to: 'tm#compute', as: :tm_compute
    post '/tm/consume', to: 'tm#consume', as: :tm_consume
  
end
