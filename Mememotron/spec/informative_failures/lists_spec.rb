require "spec_helper"

describe "A list of hash keys" do

  it "should be able to figure out the missing ones" do
    expected = %w[ asdf 2klj df1o an2d laksjdf ]
    actual   = %w[ asdf 2klj dflo an2d laksjdf ]

    expect(expected).to eq(actual)
  end

end
