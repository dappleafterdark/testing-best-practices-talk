require "spec_helper"

describe "don't spec side effects", type: :request do
  it "requires authentication for all creates" do
    [ "/crypto_currencies", "/memes" ].each do |path|
      post path
      expect(response.status).to eq(401)
    end
  end
end

describe "spec what you mean", type: :controller do
  controller do
    def create
      head :ok
    end
  end

  it "requires authentication for all indexes" do
    post :create
    expect(response.status).to eq(401)
  end
end
