require "spec_helper"

describe "don't spec side effects", type: :request do
  it "requires authentication for all indexes" do
    [ "/crypto_currencies", "/memes" ].each do |path|
      get path
      expect(response.status).to eq(401)
    end
  end
end

describe "spec what you mean", type: :controller do
  controller do
    def index
      head :ok
    end
  end

  it "requires authentication for all indexes" do
    get :index
    expect(response.status).to eq(401)
  end
end
