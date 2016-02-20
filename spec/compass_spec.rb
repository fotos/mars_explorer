require 'spec_helper'

describe Compass do
  subject(:compass) { FactoryGirl.build(:compass) }

  describe 'CARDINAL_POINTS' do
    subject { described_class::CARDINAL_POINTS }

    it { is_expected.to be_an(Array) }
    it { is_expected.to be_frozen }
    it { is_expected.to eq(%w[N E S W]) }
  end

  describe '#attr_accessors' do
    it { is_expected.to respond_to(:heading) }
    it { is_expected.to respond_to(:heading=) }
  end

  describe '.initialize' do
    let(:heading) { 'S' }
    subject(:compass) { FactoryGirl.build(:compass, heading: heading) }

    describe '#heading' do
      subject { compass.heading }

      it { is_expected.to eq(heading) }
    end

    context 'with invalid heading' do
      let(:heading) { 'F' }

      it 'raises ArgumentError' do
        expect {
          FactoryGirl.build(:compass, heading: heading)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#left' do
    subject { compass.left }

    context 'when facing N' do
      let(:compass) { FactoryGirl.build(:compass, :north) }

      it { is_expected.to eq('W') }
    end

    context 'when facing E' do
      let(:compass) { FactoryGirl.build(:compass, :east) }

      it { is_expected.to eq('N') }
    end

    context 'when facing S' do
      let(:compass) { FactoryGirl.build(:compass, :south) }

      it { is_expected.to eq('E') }
    end

    context 'when facing W' do
      let(:compass) { FactoryGirl.build(:compass, :west) }

      it { is_expected.to eq('S') }
    end
  end

  describe '#right' do
    subject { compass.right }

    context 'when facing N' do
      let(:compass) { FactoryGirl.build(:compass, :north) }

      it { is_expected.to eq('E') }
    end

    context 'when facing E' do
      let(:compass) { FactoryGirl.build(:compass, :east) }

      it { is_expected.to eq('S') }
    end

    context 'when facing S' do
      let(:compass) { FactoryGirl.build(:compass, :south) }

      it { is_expected.to eq('W') }
    end

    context 'when facing W' do
      let(:compass) { FactoryGirl.build(:compass, :west) }

      it { is_expected.to eq('N') }
    end
  end
end
