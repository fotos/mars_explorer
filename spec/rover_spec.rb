require 'spec_helper'

describe Rover do
  subject(:rover) { FactoryGirl.build(:rover) }

  describe Rover::Error do
    subject { described_class.new }

    it { is_expected.to be_kind_of(StandardError) }
  end

  describe Rover::OutOfBoundsError do
    subject { described_class.new }

    it { is_expected.to be_kind_of(Rover::Error) }
  end

  describe 'VALID_INSTRUCTIONS' do
    subject { described_class::VALID_INSTRUCTIONS }

    it { is_expected.to be_an(Array) }
    it { is_expected.to be_frozen }
    it { is_expected.to eq(%w[L R M]) }
  end

  describe '.initialize' do
    describe '#lng' do
      subject { rover.lng }

      it { is_expected.to be_zero }
    end

    describe '#lat' do
      subject { rover.lat }

      it { is_expected.to be_zero }
    end

    context 'when lng is out of bounds' do
      it 'raises RoverOutOfBoundsError' do
        expect {
          FactoryGirl.build(:rover, lng: -1)
        }.to raise_error(Rover::OutOfBoundsError)
      end
    end

    context 'when lng is out of bounds' do
      it 'raises RoverOutOfBoundsError' do
        expect {
          FactoryGirl.build(:rover, lat: -1)
        }.to raise_error(Rover::OutOfBoundsError)
      end
    end

    context 'when the heading is invalid' do
      it 'raises ArgumentError' do
        expect {
          FactoryGirl.build(:rover, heading: 'F')
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#lng' do
    subject { rover.lng }

    it { is_expected.to eq(0) }
  end

  describe '#lat' do
    subject { rover.lat }

    it { is_expected.to eq(0) }
  end

  describe '#heading' do
    subject { rover.heading }

    it { is_expected.to eq('N') }
  end

  describe '#turn_left' do
    subject { rover.turn_left }

    context 'when facing N' do
      let(:rover) { FactoryGirl.build(:rover, :north) }

      it { is_expected.to eq('W') }
    end

    context 'when facing E' do
      let(:rover) { FactoryGirl.build(:rover, :east) }

      it { is_expected.to eq('N') }
    end

    context 'when facing S' do
      let(:rover) { FactoryGirl.build(:rover, :south) }

      it { is_expected.to eq('E') }
    end

    context 'when facing W' do
      let(:rover) { FactoryGirl.build(:rover, :west) }

      it { is_expected.to eq('S') }
    end
  end

  describe '#turn_right' do
    subject { rover.turn_right }

    context 'when facing N' do
      let(:rover) { FactoryGirl.build(:rover, :north) }

      it { is_expected.to eq('E') }
    end

    context 'when facing E' do
      let(:rover) { FactoryGirl.build(:rover, :east) }

      it { is_expected.to eq('S') }
    end

    context 'when facing S' do
      let(:rover) { FactoryGirl.build(:rover, :south) }

      it { is_expected.to eq('W') }
    end

    context 'when facing W' do
      let(:rover) { FactoryGirl.build(:rover, :west) }

      it { is_expected.to eq('N') }
    end
  end

  describe '#move!' do
    shared_examples 'moving' do |heading|
      let(:lng) { 5 }
      let(:lat) { 5 }

      let(:rover) { FactoryGirl.build(:rover, heading, lng: lng, lat: lat) }

      case heading
      when :north
        specify { expect { rover.move! }.to_not change(rover, :lng) }
        specify { expect { rover.move! }.to change(rover, :lat).from(lat).to(lat + 1) }
      when :east
        specify { expect { rover.move! }.to change(rover, :lng).from(lng).to(lng + 1) }
        specify { expect { rover.move! }.to_not change(rover, :lat) }
      when :south
        specify { expect { rover.move! }.to_not change(rover, :lng) }
        specify { expect { rover.move! }.to change(rover, :lat).from(lat).to(lat - 1) }
      when :west
        specify { expect { rover.move! }.to change(rover, :lng).from(lng).to(lng - 1) }
        specify { expect { rover.move! }.to_not change(rover, :lat) }
      end

      specify do
        expect { rover.move! }.to_not change(rover, :heading)
      end
    end

    context 'when facing N' do
      it_behaves_like 'moving', :north
    end

    context 'when facing E' do
      it_behaves_like 'moving', :east
    end

    context 'when facing S' do
      it_behaves_like 'moving', :south
    end

    context 'when facing S' do
      it_behaves_like 'moving', :west
    end
  end

  describe '#to_a' do
    subject { rover.to_a }

    it { is_expected.to be_an(Array) }
    it { is_expected.to eq([0, 0, 'N']) }
  end

  describe '#to_s' do
    subject { rover.to_s }

    it { is_expected.to eq('0 0 N') }
  end
end
