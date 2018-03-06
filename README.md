# Android::Devices

Gem used to convert android model numbers (e.g. GT-I9507) into something more human readable (e.g. Samsung Galaxy S4)

## Installation

Add the following into your application's Gemfile:

`gem android-devices`

Then execute:

`bundle install`


## Update

This gem uses the devices list provided by the Google Play store as it's information store. Run `rake update` to get the latest version of the csv.
Commit, push, tag the update.