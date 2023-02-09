# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

module ActiveSupport
  class OrderedHash
    def each_key
      each { |key, value| yield key }
    end
  end
end

module ActiveRecord
  class Errors
    def initialize(base) # :nodoc:
      @base, @errors = base, ActiveSupport::OrderedHash.new
    end

    def clear
      @errors = ActiveSupport::OrderedHash.new
    end
  end

  module Validations
    module ClassMethods
      def write_inheritable_set(key, methods)
        existing_methods = read_inheritable_attribute(key) || []
        write_inheritable_attribute(key, existing_methods | methods)
      end
    end
  end
end