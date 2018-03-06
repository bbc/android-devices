require 'time'
require 'devices'

describe Android::Devices do
  subject { described_class }
  let(:path) { File.join(File.dirname(__FILE__), '..', 'spec', 'test_devices.csv') }
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
        expect(subject.display_name('Samsung', 'SM-A7000')).to eq "Samsung Galaxy A7"
      end
    end

    context 'without marketing name' do
      it 'should return the display name ' do
        subject.devices()
        expect(subject.display_name('Acer', 'E330')).to eq "Acer E330"
      end
    end
  end
end
