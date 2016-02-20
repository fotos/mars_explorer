FactoryGirl.define do
  factory :rover do
    association :plateau, strategy: :build

    transient do
      heading 'N'
      lng 0
      lat 0
    end

    trait :north do
      heading 'N'
    end

    trait :east do
      heading 'E'
    end

    trait :south do
      heading 'S'
    end

    trait :west do
      heading 'W'
    end

    initialize_with { new(plateau: plateau, lng: lng, lat: lat, heading: heading) }
  end
end
