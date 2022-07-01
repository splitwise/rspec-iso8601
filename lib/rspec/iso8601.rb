# frozen_string_literal: true

require "rspec/expectations"

RSpec::Matchers.define :be_an_iso8601_string do |precision: nil|
  match do |actual|
    raise ArgumentError, "Cannot specify keyword and chained `precision` argument" if @precision && precision

    return false unless actual.is_a?(String)

    matches = actual.match(/^\d{4}-\d{2}-\d{2}T(?:\d{2}:){2}\d{2}(?:\.(?<usec>\d+))?(?:Z|[\-+]\d{2}:\d{2})$/)

    precision ||= @precision
    matches && (precision.nil? || (matches[:usec]&.length || 0) == precision)
  end

  description do
    "be an ISO8601 string#{" with precision #{precision}" unless precision.nil?}"
  end

  chain :with_precision do |digits|
    @precision = digits
  end
end

RSpec::Matchers.alias_matcher :an_iso8601_string, :be_an_iso8601_string
