FactoryGirl.define do
  factory :position do
    transient do
      lng { 0 }
      lat { 0 }
    end

    initialize_with { new(lng: lng, lat: lat) }
  end
end
