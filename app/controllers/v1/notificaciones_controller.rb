module V1
class NotificacionesController < ApplicationController
	def index
  @notificaciones = Notificacion.all

  json_response(@notificaciones)
  end
  def geojson
  @notificaciones = Notificacion.all

  render :template => 'notificaciones/index.json'
  end
  def create
   	@notificacion = Notificacion.create!(notificacion_params)
    json_response(@notificacion, :created)
  end
  def show

  	@notificacion = Notificacion.find(params[:id])
  	 options = {}
  	 options[:include] = [:barrio, :'barrio.nombre',:cuidad, :'cuidad.nombre',:distrito, :'distrito.nombre']
 	json_string = NotificacionSerializer.new(@notificacion,options).serializable_hash.to_json
  	 json_response(json_string)
  end
 def update
    @notificacion.update(notificacion_params)
    head :no_content
  end

  def destroy
    @notificacion.destroy
    head :no_content
  end

  private

  def notificacion_params
    # whitelist params
    params.permit(:nombre,:apellido,:edad,:sexo,:fecha_notificacion,:fecha_sintoma,:barrio_id,
:cuidades_id,:distrito_id,:lonlat,:estado,:arbo_id,:serotipo_id,:usuario_laboratorio_id)
  end

  def set_notificacion
    @notificacion = Notificacion.find(params[:id])
  end





end

end
