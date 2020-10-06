# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../lib/populator_fix.rb'
Barrio.populate 3 do |u|
u.nombre =['Encarnacion','La paz','San Roque'].sample
end
Cuidad.populate 3 do |u|
u.nombre =['Encarnacion','San Pedro','San Miguel'].sample
end
Distrito.populate 3 do |u|
u.nombre =['Encarnacion','Cambyreta','Fram'].sample
end
Arbo.populate 3 do |u|
u.nombre =['Dengue','Zika','Chikungunya'].sample
end
Serotipo.populate 3 do |u|
u.nombre =['Chik','Den1','ZIKV'].sample
end
UsuarioLaboratorio.populate 3 do |u|
u.nombre =['User1','User2','User3'].sample
end
my_factory = RGeo::ActiveRecord::SpatialFactoryStore.instance.factory(:geo_type => 'point')
Notificacion.populate 100 do |u|
  u.nombre = Faker::Name.first_name
  u.apellido = Faker::Name.last_name
  u.edad =Faker::Number.between(from: 1, to: 50)
  u.sexo = Faker::Gender.short_binary_type
  u.estado = Faker::Boolean.boolean
  u.arbo_id =Faker::Number.between(from: 1, to: 3)
  u.serotipo_id =Faker::Number.between(from: 1, to: 3)
            u.barrio_id =Faker::Number.between(from: 1, to: 2)
            u.distrito_id =Faker::Number.between(from: 1, to: 3)
            u.cuidad_id =Faker::Number.between(from: 1, to: 3)
            u.lonlat = my_factory.point(Faker::Number.between(from: -55.862131118774414, to: -55.87577819824219),Faker::Number.between(from: -27.32282243746613, to: -27.360333521009597)) 
   u.usuario_laboratorio_id =Faker::Number.between(from: 1, to: 3)     
           u.fecha_notificacion = Faker::Time.between(from: 20.days.ago, to: Time.now)
           u.fecha_sintoma = Faker::Time.between(from: 20.days.ago, to: Time.now)      
  end
