Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout'
             },
             controllers: {
               sessions: 'sessions'
             },defaults: {format: :json}

  resources :assets
  resources :users do
   resources :portfolios
 end

end
