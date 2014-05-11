require "spec_helper"

Meme.create name: "Nyan Cat"

describe "failing fast on unexpected state" do

  before do
    Meme.create name: "Nyan Cat", url: url
  end

  it "should let us know if there are too many records" do
    expect(Meme.where(name: "Nyan Cat").first.url).to eq(url)
  end

  let(:url) { "http://www.example.com" }
end
