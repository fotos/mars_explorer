FactoryGirl.define do
  factory :compass do
    transient do
      heading 'N'
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
  end

  initialize_with { new(heading: heading) }
end
