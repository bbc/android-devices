
describe Android::Devices do
  describe 'update' do
    it 'should be able to update itself' do
      expect(Android::Devices.update_devices).to be(true)
    end
  end
end