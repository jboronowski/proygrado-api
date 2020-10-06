class Notificacion < ApplicationRecord
	def point(lonlat)
	set_rgeo_factory_for_column(:lonlat,
    RGeo::Geographic.spherical_factory(:srid => 4326))
end
  belongs_to :barrio
  belongs_to :cuidad
  belongs_to :distrito
  belongs_to :arbo
  belongs_to :serotipo
  belongs_to :usuario_laboratorio
end
