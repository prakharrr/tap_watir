# frozen_string_literal: true

module TapWatir
  #
  # Base class for elements
  #
  class Element
    def initialize(driver, selector)
      @driver = driver
      @selector = selector
    end

    def locate
      @element = @driver.find_element(@selector.keys.first, @selector.values.first)
    end

    def exists?
      return false if @element
      assert_exists
      true
    rescue Watir::WebDriverError::Element::NoSuchElementError
      false
    end

    def assert_exists
      locate unless @element
      return if @element
      raise UnknownObjectException
    end

    def wd
      @element || locate
    end

    private :locate, :assert_exists
  end
end
