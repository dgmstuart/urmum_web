require 'spec_helper'

describe "The urmum api" do
  def app
    Sinatra::Application
  end

  describe "post api" do
    subject (:post_api) { post "/api", { text: "noun" } }
    it { should be_ok }

    it "should return a string" do
      post_api
      expect(JSON(last_response.body)).to eq({ "text" => "You're a noun" })
    end

    it "handles input with quotes" do
      post "/api", { text: "You're a noun" }
      expect(JSON(last_response.body)).to eq({ "text" => "Your face is a noun" })
    end
  end
end
