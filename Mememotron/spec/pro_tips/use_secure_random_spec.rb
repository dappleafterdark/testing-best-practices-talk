require "spec_helper"

describe "leveraging randomness", type: :request do
  let(:unique_name) { "my-silly-meme-name" }

  before do
    post "/memes", meme: { name: unique_name }
  end

  it "is in the database" do
    expect(Meme.where(name: unique_name)).to be_one
  end
end
