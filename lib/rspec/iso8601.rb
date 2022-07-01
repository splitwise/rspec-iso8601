# frozen_string_literal: true

require "rspec/expectations"

RSpec::Matchers.define :be_an_iso8601_string do
  match do |actual|
    return false unless actual.is_a?(String)

    actual.match?(/^\d{4}-\d{2}-\d{2}T(?:\d{2}:){2}\d{2}(?:\.(?<usec>\d+))?(?:Z|[\-+]\d{2}:\d{2})$/)
  end

  description do
    "be an ISO8601 string"
  end
end

RSpec::Matchers.alias_matcher :be_an_iso8601_string, :an_iso8601_string
