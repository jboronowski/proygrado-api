class Serotipo < ApplicationRecord
	has_many :arbo_serotipo
	has_many :notificacion
	has_many :arbo, through: :arbo_serotipo
end
