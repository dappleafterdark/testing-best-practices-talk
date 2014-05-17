require "spec_helper"

describe "Use the Fetching gem" do

  json = <<-HEREDOC.strip_heredoc
    {
      "drug": {
        "similar_drugs": [
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
    api_response = JSON(json)
    first_similar = api_response["drugs"]["simi1ar_drugs"].first

    expect(first_similar["name"]).to eq("nasonex")
  end

end
