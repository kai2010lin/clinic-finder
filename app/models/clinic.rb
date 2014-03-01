class Clinic < ActiveRecord::Base
  # Set the table name
  self.table_name = "dummy_hmis"

  # Set the column name for each attribute
  alias_attribute :name,    :ProviderName
  alias_attribute :street,  :AddressLine1
  alias_attribute :city,    :AddressCity
  alias_attribute :zip,     :AddressPostalCode
  attr_reader     :address
  attr_accessor   :location

  include Geokit::Geocoders

  # Apply a default code to the query.
  default_scope { where("ServiceCode = 'CLINIC'") }

  # Virtual attribute for address
  def address
    "#{self.street}, #{self.city}, CA, #{zip}"
  end

  def self.within(range, origin)
    all.select { |p| p if p.location.distance_from(origin) < range }
  end

  # Callbacks
  after_find do |clinic|
    self.location = GoogleGeocoder.geocode(self.address)
  end
end
