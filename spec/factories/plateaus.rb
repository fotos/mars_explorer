FactoryGirl.define do
  factory :plateau do
    association :x, factory: :dimension, strategy: :build
    association :y, factory: :dimension, strategy: :build

    initialize_with { new(x: x, y: y) }
  end
end
