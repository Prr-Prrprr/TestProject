class AddRecomendationsToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :recommendation, :text
  end
end
