require 'csv'

module Android
  module Devices
    PATH = File.join(File.dirname(__FILE__), '../..', 'content', 'devices.csv')

    def self.devices
      return @devices unless @devices.nil?
      rows = CSV.read(PATH)
      @devices = rows.each_with_object({}) do |row, devices|
        manufacturer, marketing_name, _, model = row
        devices[model + manufacturer] = (marketing_name || model) if model && manufacturer
      end

      def self.display_name(manufacturer, model)
        if model && manufacturer
          @devices[model + manufacturer] || model
        else
          model
        end
      end
    end
  end
end