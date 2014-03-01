class AddNameToClinics < ActiveRecord::Migration
  def change
    add_column :clinics, :name, :string
  end
end
