json.array!(@clinics) do |clinic|
  json.extract! clinic, :id, :street, :street_optional, :city, :state, :zip
  json.url clinic_url(clinic, format: :json)
end
