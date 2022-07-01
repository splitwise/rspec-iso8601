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
end
