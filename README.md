pretty-log
==========

Some colourful and customizable inspection helpers for Active Record testing

Install
=======
        gem install pretty_log

Usage
=====
In your test_helper.rb

        Car.printable_fields = [:id, :door_id, :registration_id]

And when in need of a quick inspection

        puts car.pretty_log

or if Car has a has_many association with Tires,

        puts car.tires.pretty_log


Configurations
==============

        PrettyLog.config.key_color   = "green"
        PrettyLog.config.value_color = "blue"
        PrettyLog.config.seperator   = ","

