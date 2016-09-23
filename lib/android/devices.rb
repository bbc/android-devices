require 'android/devices/version'
require 'csv'

module Android
  module Devices

    def self.update_devices(url = '')
      csv_url = url.nil? ? 'http://storage.googleapis.com/play_public/supported_devices.csv' : url
      begin
        devices = CSV.parse(open(csv_url).read)
        File.open('devices.csv','w') {|f| f.write(devices.inject([]) { |csv,row| csv << CSV.generate_line(row) }.join("").encode('UTF-8'))}
        #puts "Devices updated: #{devices.count - 1} devices available"
        return true
      rescue Exception
        raise 'Unable to update devices'
      end
    end

    def self.list_exists
      return File.exists?('devices.csv')
    end

    def self.old_list?
      return (File.mtime('devices.csv') < Time.parse((DateTime.now - 30).to_s))
    end
  end
end
