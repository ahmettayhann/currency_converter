# frozen_string_literal: true

module ApplicationService
  class Base
    attr_reader :current_user

    def self.call(*args, &block)
      new(*args, &block).call
    end

    def initialize(*); end
  end

  class Error
  end
end
