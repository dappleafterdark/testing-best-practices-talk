require "spec_helper"

module MoreRandomness
  def rand limit
    4 # chosen by fair dice roll.
      # guaranteed to be random.
  end
end

describe "Cache Miss" do
  include MoreRandomness

  it "should fail lookup when the identifier is not in the cache" do
    identifier = rand(100)
    cache      = Hash.new
    cache.store identifier, "value"

    another_identifier = rand(100)

    expect do
      cache.fetch another_identifier
    end.to raise_error(KeyError)
  end

end
