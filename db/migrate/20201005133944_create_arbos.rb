class CreateArbos < ActiveRecord::Migration[5.2]
  def change
    create_table :arbos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
