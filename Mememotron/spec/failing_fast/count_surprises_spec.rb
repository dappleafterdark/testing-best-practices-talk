require "spec_helper"

Meme.create name: "Nyan Cat"

describe "failing fast on unexpected state" do

  before do
    Meme.create name: "Nyan Cat", url: url
  end

  it "should let us know if there are too many memes" do
    first_meme = Meme.where(name: "Nyan Cat").first
    expect(first_meme.url).to eq(url)
  end

  let(:url) { "http://www.example.com" }
end

