# frozen_string_literal: true

require 'csv'

module Android
  module Devices
    PATH = File.join(File.dirname(__FILE__), '../..', 'content', 'devices.csv')

    class << self
      # Memoizes the device list on first call
      # @return [Hash] Hash with the devices
      #
      # @note has to be called before calling display_name or manufacturer_name
      #   to initialize caches
      # TODO: rename this to `initialize` when releasing a major version
      def devices
        return @devices unless @devices.nil?

        CSV
          .read(PATH)
          .tap(&method(:load_devices))
          .tap(&method(:load_manufacturers))

        @devices
      end

      # @param manufacturer [String|nil] manufacturer of the given model
      # @param model [String|nil] phone model
      # @return [String|nil] proper device name if found, model otherwise
      def display_name(manufacturer, model)
        if model && manufacturer
          @devices[cache_key(model, manufacturer)] || model
        else
          model
        end
      end

      # @param manufacturer [String] denormalized manufacturer title
      # @return [String] proper manufacturer title
      # @example
      #   Android::Devices.manufacturer_name('samsung') => 'Samsung'
      #   Android::Devices.manufacturer_name('Htc') => 'HTC'
      def manufacturer_name(manufacturer)
        @manufacturers[manufacturer.downcase] || manufacturer
      end

      private

      def load_devices(rows)
        @devices = rows.each_with_object({}) do |row, devices|
          manufacturer, marketing_name, _, model = row

          next unless model && manufacturer

          devices[cache_key(model, manufacturer)] = (marketing_name || model)
        end
      end

      def load_manufacturers(rows)
        @manufacturers = rows.each_with_object({}) do |row, manufacturers|
          manufacturer, _ = row

          manufacturers[manufacturer.downcase] = manufacturer if manufacturer
        end
      end

      def cache_key(model, manufacturer)
        model.downcase + manufacturer.downcase
      end
    end
  end
end
