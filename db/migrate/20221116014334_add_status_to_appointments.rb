class AddStatusToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :status, :string, null: false, default: 'open'
  end
end
