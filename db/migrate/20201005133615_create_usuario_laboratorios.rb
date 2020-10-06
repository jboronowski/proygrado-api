class CreateUsuarioLaboratorios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuario_laboratorios do |t|
      t.string :nombre
      t.string :ci
      t.references :laboratorio, foreign_key: true

      t.timestamps
    end
  end
end
