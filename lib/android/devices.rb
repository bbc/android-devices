require 'android/devices/model'
require 'csv'

module Android
  module Devices

    def self.update_devices(url = '')
      csv_url = url.nil? || url.empty? ? 'http://storage.googleapis.com/play_public/supported_devices.csv' : url
      begin
        devices = CSV.parse(open(csv_url).read)
        File.open("#{path}/devices.csv",'w') {|f| f.write(devices.inject([]) { |csv,row| csv << CSV.generate_line(row) }.join('').encode('UTF-8'))}
        return true
      rescue Exception
        raise 'Unable to update devices'
      end
    end

    def self.path
      @path || '.'
    end

    def self.path=(path)
      @path = path
    end

    def self.list_exists
      return File.exists?("#{path}/devices.csv")
    end

    def self.old_list?
      return (File.mtime("#{path}/devices.csv") < Time.parse((DateTime.now - 30).to_s))
    end

    def self.search_by_model(model)
      models.select { |device| device.model == model}.first
    end

    def self.search_by_manufacturer(manufacturer)
      models.select { |device| device.manufacturer == manufacturer}
    end

    def self.models
      return @models unless @models.nil?
      @models = []
      devices.shift
      devices.each do |device|
        @models << Model.new(device[0], device[1], device[2], device[3])
      end
      @models
    end

    def self.devices
      return @devices unless @devices.nil?
      return [] unless list_exists
      @devices = CSV.read("#{path}/devices.csv")
      @devices
    end
  end
end
