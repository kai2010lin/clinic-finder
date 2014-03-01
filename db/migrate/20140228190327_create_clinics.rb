class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.text :street
      t.text :street_optional
      t.text :city
      t.text :state
      t.text :zip

      t.timestamps
    end
  end
end
