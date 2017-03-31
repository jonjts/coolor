Rails.application.routes.draw do
  
  scope "(:locale)", locale: /en|pt/ do
  	
  end

  get '/:locale' => 'home#index', locale: /en|pt/
  get '/auth/spotify/callback', to: 'home#spotify',  locale: /en|pt/
  root :to => "home#index"
end
