class Arbo < ApplicationRecord
	has_many :arbo_serotipo
	has_many :notificacion
	has_many :serotipo, through: :arbo_serotipo
end
