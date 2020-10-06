class Barrio < ApplicationRecord
	has_many :distrito_cuidad_barrio
has_many :notificacion
	has_many :cuidad, :through => :distrito_cuidad_barrio
	has_many :distrito, :through => :distrito_cuidad_barrio
end
