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
end
