require 'spec_helper'

describe Plateau do
  subject(:plateau) { FactoryGirl.build(:plateau) }

  describe '#attr_readers' do
    it { is_expected.to respond_to(:x) }
    it { is_expected.to respond_to(:y) }
  end

  describe '.initialize' do
    describe '#x' do
      subject { plateau.x }

      it { is_expected.to be_a(Dimension) }
    end

    describe '#y' do
      subject { plateau.y }

      it { is_expected.to be_a(Dimension) }
    end

    context 'with mismatching dimension lengths' do
      let(:x) { FactoryGirl.build(:dimension, min: 0, max: 5) }
      let(:y) { FactoryGirl.build(:dimension, min: 0, max: 3) }

      it 'raises ArgumentError' do
        expect {
          FactoryGirl.build(:plateau, x: x, y: y)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#include?' do
    let(:position) { FactoryGirl.build(:position) }

    subject { plateau.include?(position) }

    it { is_expected.to be(true) }

    context 'when the position lng < min' do
      let(:position) { FactoryGirl.build(:position, lng: plateau.x.min - 1) }

      it { is_expected.to eq(false) }
    end

    context 'when the position lng > max' do
      let(:position) { FactoryGirl.build(:position, lng: plateau.x.max + 1) }

      it { is_expected.to eq(false) }
    end

    context 'when the position lat > min' do
      let(:position) { FactoryGirl.build(:position, lat: plateau.y.min - 1) }

      it { is_expected.to eq(false) }
    end

    context 'when the position lat > max' do
      let(:position) { FactoryGirl.build(:position, lat: plateau.y.max + 1) }

      it { is_expected.to eq(false) }
    end
  end
end
