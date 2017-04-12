Rails.application.routes.draw do

  scope "(:locale)", locale: /en|pt-BR/ do
    get '/auth/spotify/callback', to: 'home#spotify'
    get '/home/playlist', to: 'home#playlist'
    get '/home/spotify'

    root :to => "home#index"
  end

  resources :language do
    post :set_pt, :on => :collection
    post :set_en, :on => :collection
  end

end
