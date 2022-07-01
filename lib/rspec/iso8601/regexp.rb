# frozen_string_literal: true

module Rspec
  module ISO8601
    REGEXP = /^\d{4}-\d{2}-\d{2}T(?:\d{2}:){2}\d{2}(?:\.(?<usec>\d+))?(?:Z|[\-+]\d{2}:\d{2})$/.freeze
  end
end
