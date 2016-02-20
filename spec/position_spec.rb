require 'spec_helper'

describe Position do
  subject(:position) { FactoryGirl.build(:position) }

  describe '#attr_accesors' do
    it { is_expected.to respond_to(:lng) }
    it { is_expected.to respond_to(:lng=) }
    it { is_expected.to respond_to(:lat) }
    it { is_expected.to respond_to(:lat=) }
  end

  describe '.initialize' do
    describe '#lng' do
      subject { position.lng }

      it { is_expected.to eq(0) }
    end

    describe '#lat' do
      subject { position.lat }

      it { is_expected.to eq(0) }
    end
  end

  describe '#to_a' do
    subject { position.to_a }

    it { is_expected.to be_an(Array) }
    it { is_expected.to eq([0, 0]) }
  end
end
