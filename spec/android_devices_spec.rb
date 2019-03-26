# frozen_string_literal: true

require 'time'
require 'android/devices'

describe Android::Devices do
  subject { described_class }

  describe '#devices' do
    it 'loads the CSV only once ' do
      expect(CSV).to receive(:read).once.and_call_original
      subject.devices
      subject.devices
    end
  end

  describe '#display_name' do
    before { subject.devices }

    context 'with marketing name' do
      it 'returns the display name' do
        expect(subject.display_name('Samsung', 'SM-A7000')).to eq 'Galaxy A7'
      end

      it 'is case-insensitive' do
        expect(subject.display_name('samSunG', 'sm-a7000')).to eq 'Galaxy A7'
      end
    end

    context 'without marketing name' do
      it 'returns the display name' do
        expect(subject.display_name('Acer', 'E330')).to eq 'E330'
      end
    end

    context 'unknown device' do
      it 'returns the passed model name display name' do
        expect(subject.display_name('Some', 'Model')).to eq 'Model'
      end
    end
  end

  describe '#manufacturer_name' do
    before { subject.devices }

    context 'when the manufacturer is unknown' do
      it 'returns the passed manufacturer back' do
        expect(subject.manufacturer_name('Some')).to eq 'Some'
      end
    end

    context 'when the manufacturer is known' do
      manufacturers = [
        ['ag mobile', 'AG Mobile'],
        %w[Amtc AMTC],
        %w[samsung Samsung],
        %w[Iriver iRiver],
        %w[Novo novo]
      ]

      manufacturers.each do |(input, expected)|
        it "returns #{expected} for #{input}" do
          expect(subject.manufacturer_name(input)).to eq expected
        end
      end
    end
  end
end
