# frozen_string_literal: true

RSpec.describe "be_an_iso8601_string" do
  context "with a negative UTC offset" do
    let(:string) { "2022-07-01T15:30:01-04:00" }

    specify { expect(string).to be_an_iso8601_string }
  end

  context "with a positive UTC offset" do
    let(:string) { "2022-07-01T15:30:01+04:00" }

    specify { expect(string).to be_an_iso8601_string }
  end

  context "with a zero offset" do
    let(:string) { "2022-07-01T15:30:01Z" }

    specify { expect(string).to be_an_iso8601_string }
  end

  context "with microseconds" do
    let(:string) { "2022-07-01T15:30:01.670405Z" }

    specify { expect(string).to be_an_iso8601_string }
  end

  context "with an invalid string" do
    let(:string) { "ceci n'est pas une ISO8601 string" }

    specify { expect(string).not_to be_an_iso8601_string }

    it "fails with a useful message" do
      expect do
        expect(string).to be_an_iso8601_string
      end.to fail_with("expected \"#{string}\" to be an ISO8601 string")
    end
  end

  context "with invalid types" do
    specify { expect(:abc).not_to be_an_iso8601_string }
    specify { expect(123).not_to be_an_iso8601_string }
    specify { expect({ hi: :there }).not_to be_an_iso8601_string }
  end

  describe "when microsecond precision is specified" do
    let(:six_micros) { "2022-07-01T15:30:01.670405Z" }
    let(:zero_micros) { "2022-07-01T15:30:01Z" }

    specify { expect(six_micros).to be_an_iso8601_string(precision: 6) }
    specify { expect(six_micros).not_to be_an_iso8601_string(precision: 4) }
    specify { expect(zero_micros).to be_an_iso8601_string(precision: 0) }
    specify { expect(zero_micros).not_to be_an_iso8601_string(precision: 2) }

    it "fails with a useful message" do
      expect do
        expect(zero_micros).to be_an_iso8601_string(precision: 2)
      end.to fail_with("expected \"#{zero_micros}\" to be an ISO8601 string with precision 2")
    end
  end

  describe "chaining precision expectation" do
    let(:six_micros) { "2022-07-01T15:30:01.670405Z" }
    let(:zero_micros) { "2022-07-01T15:30:01Z" }

    specify { expect(six_micros).to be_an_iso8601_string.with_precision(6) }
    specify { expect(six_micros).not_to be_an_iso8601_string.with_precision(4) }
    specify { expect(zero_micros).to be_an_iso8601_string.with_precision(0) }
    specify { expect(zero_micros).not_to be_an_iso8601_string.with_precision(2) }

    context "when using keyword argument and chain" do
      it "raises with a useful message" do
        expect do
          expect(six_micros).to be_an_iso8601_string(precision: 6).with_precision(6)
        end.to raise_error(ArgumentError, /cannot specify keyword and/i)
      end
    end
  end

  describe "chaining UTC expectation" do
    let(:in_utc) { "2022-07-01T15:30:01.670405Z" }
    let(:not_in_utc) { "2022-07-01T15:30:01+04:00" }

    it "works with precision chain" do
      expect(in_utc).to be_an_iso8601_string.with_precision(6).in_utc
      expect(in_utc).to be_an_iso8601_string.in_utc.with_precision(6)
    end

    it "fails with a useful message" do
      expect do
        expect(not_in_utc).to be_an_iso8601_string.in_utc
      end.to fail_with("expected \"#{not_in_utc}\" to be an ISO8601 UTC string")
    end

    specify { expect(in_utc).to be_an_iso8601_string.in_utc }
    specify { expect(not_in_utc).not_to be_an_iso8601_string.in_utc }
  end

  describe "aliases" do
    it "is aliased as `an_iso8601_string`" do
      expect({ key: "2022-07-01T15:30:01Z" }).to match(key: an_iso8601_string)
    end
  end
end
