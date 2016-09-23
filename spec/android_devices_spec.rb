
describe Android::Devices do
  describe 'update' do
    it 'should be able to update itself' do
      expect(Android::Devices.update_devices('spec/test_devices.csv')).to be(true)
      expect(CSV.read('devices.csv').count).to be(4)
    end
  end
end