# Android::Devices

Gem used to convert android model numbers (e.g. GT-I9507) into something more human readable (e.g. Samsung Galaxy S4)

## Installation

Add the following into your application's Gemfile:

`gem android-devices`

Then execute:

`bundle install`


## Usage

This gem uses the devices list provided by the Google Play store as it's information store. When you first run the gem it
will attempt to automatically download the list, if you wish to re-download the list you can use the following command:

` Android::Devices.update_devices`

To then search for a device, you can do something similar to the following:

```
device = Android::Devices.search_by_model('GT-I9507')
=> #<Android::Devices::Model:0x007fadd9582d28 @manufacturer="Samsung", @brand="Galaxy S4", @device="jftdd", @model="GT-I9507">

device.name
=> "Samsung Galaxy S4"

device.brand
=> "Galaxy S4"

```

If a brand name isn't available it will make use the manufacturer and model as the name:

```
device = Android::Devices.search_by_model('GT-S5820')
=> #<Android::Devices::Model:0x007f93889a4700 @manufacturer="Samsung", @brand=nil, @device="GT-S5820", @model="GT-S5820">

device.name
=> "Samsung GT-S5820"
```

Finally, if you want a list of devices by a certain manufacturer you can:

```
devices = Android::Devices.search_by_manufacturer('Samsung')
=> [#<Android::Devices::Model:0x007f9388864278 @manufacturer="Samsung", @brand="Galaxy Core Prime", @device="coreprimeltetfnvzw", @model="SM-S820L">,
    #<Android::Devices::Model:0x007f9388864250 @manufacturer="Samsung", @brand="Galaxy Core Prime", @device="coreprimeltevzw", @model="SM-G360V">,
    #<Android::Devices::Model:0x007f9388864228 @manufacturer="Samsung", @brand="Galaxy Core Prime", @device="coreprimeve3g", @model="SM-G361H">,
    etc.
```