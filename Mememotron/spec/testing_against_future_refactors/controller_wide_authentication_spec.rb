require "spec_helper"

describe "getting too much for free", type: :request do

  it "should require us to specify new behaviour" do
    ["/crypto_currencies/new",
     "/crypto_currencies/edit"].each do |path|

      get path, name: "Satoshi Nakamoto"
      expect(response.status).to eq(422)
    end
  end

end

# add bitcoin method.
# see that spec is not required to write it.
# move it.
# embarrass self
