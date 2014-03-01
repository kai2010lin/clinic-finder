class Clinic < ActiveRecord::Base
  # Set the table name
  self.table_name = "dummy_hmis"

  # Set the column name for each attribute
  alias_attribute :name,    :ProviderName
  alias_attribute :address, :AddressLine1
  alias_attribute :city,    :AddressCity
  alias_attribute :zip,     :AddressPostalCode

  # Apply a default code to the query.
  default_scope { where("ServiceCode = 'CLINIC'") }
end

