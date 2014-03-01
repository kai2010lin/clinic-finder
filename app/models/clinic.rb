class Clinic < ActiveRecord::Base
  self.table_name = "dummy_hmis"
  alias_attribute :name, :ProviderName

  # Apply a default code to the query.
  default_scope { where("ServiceCode = 'CLINIC'") }
end

