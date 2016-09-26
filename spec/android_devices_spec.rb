describe Android::Devices do
  describe 'check' do

    it 'should check if the devices list exists' do
      File.delete('devices.csv') if File.exists? 'devices.csv'
      expect(Android::Devices.list_exists).to be(false)
    end

    it 'should warn if the devices list is over 30 days old' do
      FileUtils.touch 'devices.csv', :mtime => Time.parse((DateTime.now - 31).to_s)
      expect(Android::Devices.old_list?).to be(true)
    end
  end

  describe 'update' do
    it 'should be able to update itself' do
      expect(Android::Devices.update_devices('spec/test_devices.csv')).to be(true)
      expect(Android::Devices.list_exists).to be(true)
      expect(CSV.read('devices.csv').count).to be(4)
    end
  end

  describe 'search' do
    before(:all) do
      Android::Devices.update_devices('spec/test_devices.csv')
    end

    it 'should search by model' do
      expect(Android::Devices.search_by_model('GT-I9507').first.manufacturer).to eq('Samsung')
    end

    it 'should search by manufacturer' do
      expect(Android::Devices.search_by_manufacturer('Samsung').count).to be(3)
    end
  end
end