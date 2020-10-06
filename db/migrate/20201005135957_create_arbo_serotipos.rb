class CreateArboSerotipos < ActiveRecord::Migration[5.2]
  def change
    create_table :arbo_serotipos do |t|
      t.references :arbo, foreign_key: true
      t.references :serotipo, foreign_key: true

      t.timestamps
    end
  end
end
