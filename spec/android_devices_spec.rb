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
    context 'with marketing name' do
      it 'should return the display name ' do
        subject.devices()
        expect(subject.display_name('Samsung', 'SM-A7000')).to eq 'Galaxy A7'
      end
    end

    context 'without marketing name' do
      it 'should return the display name ' do
        subject.devices()
        expect(subject.display_name('Acer', 'E330')).to eq 'E330'
      end
    end

    context 'unknown device' do
      it 'should return the passed model name display name ' do
        subject.devices()
        expect(subject.display_name('Some', 'Model')).to eq 'Model'
      end
    end
  end
end
