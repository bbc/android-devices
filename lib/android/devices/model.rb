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
    end
  end
end