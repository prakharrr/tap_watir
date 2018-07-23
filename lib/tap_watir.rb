require "watir"
require 'appium_lib_core'
require 'appium/driver'
require 'tap_watir/element'


module TapWatir
  class App

    attr_accessor :driver

    def initialize(opts)
      url = opts[:caps].delete(:url)
      @driver = Appium::Core.for(self, opts).start_driver(server_url: url)
    end

    def quit
      @driver.quit
    end
    alias_method :close, :quit

    def element(selector)
      Element.new(driver,selector)
    end
  end

  class MobileBrowser < Watir::Browser
    def initialize(opts)
      @browser = super Selenium::WebDriver.for(:remote, opts)
    end
  end
end
