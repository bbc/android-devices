# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'open-uri'
require 'csv'

task :update do
  csv_url = 'http://storage.googleapis.com/play_public/supported_devices.csv'
  devices = CSV.parse(open(csv_url).read)
  File.open('content/devices.csv', 'w') { |f| f.write(devices.inject([]) { |csv, row| csv << CSV.generate_line(row) }.join('').encode('UTF-8')) }
end

#  TODO: Move to rake task
# def self.update_devices(url = '')
#   csv_url = url.nil? || url.empty? ? 'http://storage.googleapis.com/play_public/supported_devices.csv' : url
#   begin
#     devices = CSV.parse(open(csv_url).read)
#     File.open("#{path}/devices.csv",'w') {|f| f.write(devices.inject([]) { |csv,row| csv << CSV.generate_line(row) }.join('').encode('UTF-8'))}
#     return true
#   rescue Exception => e
#     puts e
#     raise 'Unable to update devices'
#   end
# end
