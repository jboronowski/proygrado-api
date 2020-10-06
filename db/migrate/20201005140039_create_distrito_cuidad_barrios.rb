class CreateDistritoCuidadBarrios < ActiveRecord::Migration[5.2]
  def change
    create_table :distrito_cuidad_barrios do |t|
      t.references :barrio, foreign_key: true
      t.references :cuidad, foreign_key: true
      t.references :distrito, foreign_key: true

      t.timestamps
    end
  end
end
