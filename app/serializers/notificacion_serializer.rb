class NotificacionSerializer
  include JSONAPI::Serializer

  attributes :nombre, :apellido,:edad,:sexo,:fecha_notificacion,:fecha_sintoma,:estado,:lonlat
  belongs_to :barrio, serializer: BarrioSerializer
  belongs_to :cuidad, serializer: CuidadSerializer
  belongs_to :distrito, serializer: DistritoSerializer
  belongs_to :arbo, serializer: ArboSerializer
  belongs_to :serotipo, serializer: SerotipoSerializer
end
