class CreateNotificacions < ActiveRecord::Migration[5.2]
  def change
    create_table :notificacions do |t|
      t.string :nombre
      t.string :apellido
      t.integer :edad
      t.string :sexo
      t.date :fecha_notificacion
      t.date :fecha_sintoma
      t.references :barrio, foreign_key: true
      t.references :cuidad, foreign_key: true
      t.references :distrito, foreign_key: true
      t.st_point :lonlat
      t.boolean :estado
      t.references :arbo, foreign_key: true
      t.references :serotipo, foreign_key: true
      t.references :usuario_laboratorio, foreign_key: true

      t.timestamps
    end
  end
end
