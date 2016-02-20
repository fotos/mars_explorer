require 'spec_helper'

describe Dimension do
  subject(:dimension) { FactoryGirl.build(:dimension) }

  describe '#attr_readers' do
    it { is_expected.to respond_to(:min) }
    it { is_expected.to respond_to(:max) }
  end

  describe '.initialize' do
    describe '#min' do
      subject { dimension.min }

      it { is_expected.to eq(0) }
    end

    describe '#max' do
      subject { dimension.max }

      it { is_expected.to eq(10) }
    end

    context 'when min > max' do
      let(:min) { 2 }
      let(:max) { min - 1 }

      it 'raises ArgumentError' do
        expect {
          FactoryGirl.build(:dimension, min: min, max: max)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#length' do
    subject { dimension.length }

    it { is_expected.to eq(10) }
  end
end
