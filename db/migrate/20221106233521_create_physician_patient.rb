class CreatePhysicianPatient < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.integer :physician_id, null: false
      t.integer :patient_id, null: false

      t.timestamps
    end
  end
end
