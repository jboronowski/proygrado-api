class CreateBarrios < ActiveRecord::Migration[5.2]
  def change
    create_table :barrios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
