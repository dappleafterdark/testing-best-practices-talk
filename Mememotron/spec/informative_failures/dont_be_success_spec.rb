require "spec_helper"

describe "response codes", type: :request do

  it "should give details if a request spec fails" do
    get "/memes"
    expect(response).to be_success
  end

end
