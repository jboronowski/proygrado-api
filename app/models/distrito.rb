class Distrito < ApplicationRecord
	has_many :distrito_cuidad_barrio
	has_many :notificacion

	has_many :barrio, through: :distrito_cuidad_barrio

	has_many :cuidad, through: :distrito_cuidad_barrio
end
