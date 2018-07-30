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

    def assert_exists
      locate unless @element
      return if @element
      raise Watir::Exception::UnknownObjectException
    end

    def present?
      visible?
    rescue Watir::Exception::UnknownObjectException
      false
    end

    private :locate, :assert_exists
  end
end
