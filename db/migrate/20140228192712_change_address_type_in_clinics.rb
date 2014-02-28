class ChangeAddressTypeInClinics < ActiveRecord::Migration
  def up
    change_column :clinics, :street, :string
    change_column :clinics, :street_optional, :string
    change_column :clinics, :city, :string
    change_column :clinics, :state, :string
    change_column :clinics, :zip, :string
  end

  def down
    change_column :clinics, :street, :text
    change_column :clinics, :street_optional, :text
    change_column :clinics, :city, :text
    change_column :clinics, :state, :text
    change_column :clinics, :zip, :text
  end
end
