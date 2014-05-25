require "spec_helper"

describe "Use the Fetching gem" do

  json = <<-HEREDOC.strip_heredoc
    {
      "drug": {
        "name": "flownase",
        "similars": [
          {
            "href": "https://covermymeds.com/...",
            "name": "nasonex"
          },
          {
            "href": "https://covermymeds.com/...",
            "name": "mucinex"
          }
        ]
      }
    }
  HEREDOC

  it "should be easy to see mistakes" do
    api_data = JSON(json)
    similar = api_data["drugs"]["similars"].first

    expect(similar["name"]).to eq("nasonex")
  end

end
