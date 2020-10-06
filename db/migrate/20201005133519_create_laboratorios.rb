class CreateLaboratorios < ActiveRecord::Migration[5.2]
  def change
    create_table :laboratorios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
