Rails.application.routes.draw do
	 namespace :v1 do
    resources :todos
    resources :notificaciones
      get '/geojson',
	to: 'notificaciones#geojson',
	as: 'geojson'

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
