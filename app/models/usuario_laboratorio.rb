class UsuarioLaboratorio < ApplicationRecord
  belongs_to :laboratorio
  has_many :notificacion
end
