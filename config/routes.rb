Rails.application.routes.draw do
	 namespace :v1 do
    resources :todos
    resources :notificaciones
      get '/geojson',
	to: 'notificaciones#geojson',
	as: 'geojson'
	get '/activos',
	to: 'notificaciones#activos',
	as: 'activos'
	get '/welcome',
	to: 'notificaciones#welcome',
	as: 'welcome'
	 get '/barrio',
	to: 'notificaciones#barrio',
	as: 'barrio'
	 get '/distrito',
	to: 'notificaciones#distrito',
	as: 'distrito'
	

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
