module Android
  module Devices
    class Model
      attr_accessor :manufacturer, :brand, :device, :model

      def initialize(manufacturer, brand, device, model)
        @manufacturer = manufacturer
        @brand = brand
        @device = device
        @model = model
      end

      def name
        return "#{@manufacturer} #{@brand}" if @brand
        "#{@manufacturer} #{@model}"
      end
    end
  end
end