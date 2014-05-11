require "spec_helper"

describe "A list of hash keys" do

  it "should be able to figure out the missing ones" do
    expected = %w[ asof lkjwn  asdf 2klj df1o an2d oieoin laksjdf ]
    actual   = %w[ asof lkjwn  asdf 2klj dflo an2d oieoin laksjdf ]

    expect(expected).to eq(actual)
  end

end
