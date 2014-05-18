require "spec_helper"

describe "spec what you really mean, not side effects -- bad", type: :request do
  it "requires authentication for all indexes" do
    [ "/crypto_currencies", "/memes" ].each do |path|
      get path
      expect(response.status).to eq(401)
    end
  end
end

describe "spec what you really mean, not side effects -- good", type: :request do

  it "requires authentication for all indexes" do
    get "authorized/index"
    expect(response.status).to eq(401)
  end

  before do
    path = "authorized/index"

    # make a throw away controller
    controller = Class.new(ApplicationController) do
      def index
        head :ok
      end
    end

    # make it route-able
    Rails.application.routes.draw do
      get path, to: controller.action(:index)
    end
  end

  after do
    # clean up so the route isn't available to other tests
    Kernel.silence_warnings { Rails.application.reload_routes! }
  end

end

