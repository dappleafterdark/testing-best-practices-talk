require "spec_helper"

describe "failing fast with create!" do

  it "should let us know if the setup fails" do
    url = "http://example.com"
    meme = Meme.create url: url

    expect(Meme.find(meme.id).url).to eq(url)
  end

end
