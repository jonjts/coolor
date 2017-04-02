Rails.application.routes.draw do

  scope "(:locale)", locale: /en|pt-BR/ do

  end

  get '/:locale' => 'home#index', locale: /en|pt-BR/
  get '/auth/spotify/callback', to: 'home#spotify',  locale: /en|pt-BR/
  get '/home/playlist', to: 'home#playlist',  locale: /en|pt-BR/
  get '/home/spotify',  locale: /en|pt-BR/
  root :to => "home#index"
end
