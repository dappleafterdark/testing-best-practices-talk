require "spec_helper"

describe "Use the Fetching gem" do

  json = <<-HEREDOC.strip_heredoc
    {
      "drug": {
        "similars": [
          {
            "href": "https://covermymeds.com/...",
            "name": "nasonex"
          },
          {
            "href": "https://covermymeds.com/...",
            "name": "mucinex"
          }
        ],
        "name": "flownase"
      }
    }
  HEREDOC

  it "should be easy to see mistakes" do
    api_data = JSON(json)
    similar = api_data["drugs"]["simi1ars"].first

    expect(similar["name"]).to eq("nasonex")
  end

end
