module V1
class NotificacionesController < ApplicationController
	def index
  @notificaciones = Notificacion.joins("INNER JOIN arbos ON arbos.id = notificacions.arbo_id 
    INNER JOIN serotipos ON serotipos.id = notificacions.serotipo_id 
    INNER JOIN barrios ON barrios.id = notificacions.barrio_id 
    INNER JOIN cuidads ON cuidads.id = notificacions.cuidad_id
    INNER JOIN distritos ON distritos.id = notificacions.distrito_id
    ")
  .select("notificacions.*, arbos.nombre as arbo_nombre, serotipos.nombre as serotipo_nombre,
    cuidads.nombre as cuidad_nombre, barrios.nombre as barrio_nombre, distritos.nombre as distrito_nombre")
   #options = {}
  #options[:include] = [:barrio,:cuidad,:distrito,:arbo,:serotipo]
  #json_string = NotificacionSerializer.new(@notificaciones,options)
  json_response(@notificaciones)
  end
  def activos
    @notificaciones = Notificacion.joins("INNER JOIN arbos ON arbos.id = notificacions.arbo_id 
    INNER JOIN serotipos ON serotipos.id = notificacions.serotipo_id 
    INNER JOIN barrios ON barrios.id = notificacions.barrio_id 
    INNER JOIN cuidads ON cuidads.id = notificacions.cuidad_id
    INNER JOIN distritos ON distritos.id = notificacions.distrito_id
    ")
  .select("notificacions.*,arbos.nombre as arbo_nombre, serotipos.nombre as serotipo_nombre,
    cuidads.nombre as cuidad_nombre, barrios.nombre as barrio_nombre, distritos.nombre as distrito_nombre").where(:estado  => true)
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
  def barrio
    arbo_id = params[:arbo_id]
      @barrio = Temp.select("json_build_object(
    'type',       'Feature',
    'properties', json_build_object(
        'clave', temps.clave,
    'cantidad', (select t.cantidad from (SELECT  count(clave) as cantidad, temps.clave
FROM temps,notificacions where ST_Intersects(ST_SetSRID(ST_Point(ST_X(notificacions.lonlat),ST_Y(notificacions.lonlat)),4326),temps.geom
        ) AND notificacions.arbo_id =" +arbo_id+ "group by clave,barlo_desc,temps.ogc_fid) as t  where temps.clave = t.clave),
        'departamento', temps.dpto_desc,
        'distrito', temps.dist_desc,
        'barrio', temps.barlo_desc
     ),
    'geometry',   ST_AsGeoJSON(geom)::json
    
 ) as geojson")
 json_response(@barrio)
      #render :template => 'notificaciones/barrio.json'
  end

  def distrito
    arbo_id = params[:arbo_id]
    fecha_inicio = params[:fecha_inicio]
    fecha_fin =   params[:fecha_fin]
    @distrito = TempDistrito.select("json_build_object(
    'type',       'Feature',
    'properties', json_build_object(
        'clave', temp_distritos.clave,
    'cantidad', (select t.cantidad from (SELECT  count(clave) as cantidad, temp_distritos.clave
FROM temp_distritos,notificacions where ST_Intersects(ST_SetSRID(ST_Point(ST_X(notificacions.lonlat),ST_Y(notificacions.lonlat)),4326),temp_distritos.geom
        ) AND notificacions.arbo_id =" +arbo_id+ "AND notificacions.fecha_notificacion > "+fecha_inicio+ "AND notificacions.fecha_notificacion <"+fecha_fin+"group by clave,dist_desc,temp_distritos.id) as t  where temp_distritos.clave = t.clave),
        'departamento', temp_distritos.dpto_desc,
        'distrito', temp_distritos.dist_desc
     ),
    'geometry',   ST_AsGeoJSON(geom)::json
    
 ) as geojson")
 json_response(@distrito)
  end

  def welcome
  total= Arbo.joins("INNER JOIN (select arbo_id,count(*) as total from notificacions group by arbo_id) as t on t.arbo_id=arbos.id").select("arbos.nombre, total")
  Groupdate.week_start = :monday
  semana_dengue= Notificacion.group_by_week(:fecha_sintoma, last: 0, current: true).where(arbo_id: 1).count
  semana_zika=Notificacion.group_by_week(:fecha_sintoma, last: 0, current: true).where(arbo_id: 2).count
  semana_chikungunya=Notificacion.group_by_week(:fecha_sintoma, last: 0, current: true).where(arbo_id: 3).count
  hoy_dengue=Notificacion.group_by_day(:fecha_sintoma, range: Time.now..Time.now).where(arbo_id: 1).count
  hoy_zika=Notificacion.group_by_day(:fecha_sintoma, range: Time.now..Time.now).where(arbo_id: 2).count
  hoy_chikungunya=Notificacion.group_by_day(:fecha_sintoma, range: Time.now..Time.now).where(arbo_id: 3).count
  semana6_dengue= Notificacion.group_by_week(:fecha_sintoma, last: 6, current: true).where(arbo_id: 1).count
 semana6_zika= Notificacion.group_by_week(:fecha_sintoma, last: 6, current: true).where(arbo_id: 2).count
 semana6_chikungunya= Notificacion.group_by_week(:fecha_sintoma, last: 6, current: true).where(arbo_id: 3).count
 año_dengue=  Notificacion.group_by_month(:fecha_sintoma, range: Date::MONTHNAMES[1]..Time.now).where(arbo_id: 1).count
 año_zika=  Notificacion.group_by_month(:fecha_sintoma,range: Date::MONTHNAMES[1]..Time.now).where(arbo_id: 2).count
 año_chikungunya=  Notificacion.group_by_month(:fecha_sintoma,range: Date::MONTHNAMES[1]..Time.now).where(arbo_id: 3).count
    
  response = {total: total,semana_dengue: semana_dengue,semana_zika: semana_zika,
    semana_chikungunya: semana_chikungunya, hoy_dengue: hoy_dengue, hoy_zika: hoy_zika, hoy_chikungunya: hoy_chikungunya, 
    semana6_dengue: semana6_dengue, semana6_zika: semana6_zika, semana6_chikungunya: semana6_chikungunya,
    año_dengue: año_dengue, año_zika: año_zika, año_chikungunya: año_chikungunya
  }
  json_response(response)
  end

  def show
    @notificacions = Notificacion.joins("INNER JOIN arbos ON arbos.id = notificacions.arbo_id 
    INNER JOIN serotipos ON serotipos.id = notificacions.serotipo_id 
    INNER JOIN barrios ON barrios.id = notificacions.barrio_id 
    INNER JOIN cuidads ON cuidads.id = notificacions.cuidad_id
    INNER JOIN distritos ON distritos.id = notificacions.distrito_id
    ")
  .select("notificacions.*, ST_X(notificacions.lonlat) as x,ST_Y(notificacions.lonlat) as y, arbos.nombre as arbo_nombre, serotipos.nombre as serotipo_nombre,
    cuidads.nombre as cuidad_nombre, barrios.nombre as barrio_nombre, distritos.nombre as distrito_nombre").where(:id  => params[:id])

    json_response(@notificacions)
    
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
