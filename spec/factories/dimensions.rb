FactoryGirl.define do
  factory :dimension do
    transient do
      min { 0 }
      max { 10 }
    end

    initialize_with { new(min: min, max: max) }
  end
end
