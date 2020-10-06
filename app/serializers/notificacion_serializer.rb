class NotificacionSerializer
  include JSONAPI::Serializer

  attributes :nombre, :apellido,:edad,:sexo,:fecha_notificacion,:fecha_sintoma,:estado
  belongs_to :barrio
  belongs_to :cuidad
  belongs_to :distrito
  belongs_to :arbo
  belongs_to :serotipo
end
