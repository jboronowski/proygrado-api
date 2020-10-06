
json.array! @notificaciones do |notificacion|
json.type "FeatureCollection"
json.features 
  json.type "Feature"
  json.properties do
	json.time notificacion.fecha_sintoma.strftime("%Y-%m-%d") 
	json.arbo notificacion.arbo.nombre
	json.serotipo notificacion.serotipo.nombre
	json.estado notificacion.estado
	json.nombre notificacion.nombre
	json.apellido notificacion.apellido
	json.edad notificacion.edad
	json.sexo notificacion.sexo
	json.barrio notificacion.barrio.nombre
	json.distrito notificacion.distrito.nombre
	json.cuidad notificacion.cuidad.nombre


	end
  json.geometry do
  json.type "Point"
  json.coordinates [notificacion.lonlat.x,notificacion.lonlat.y]
  end
end