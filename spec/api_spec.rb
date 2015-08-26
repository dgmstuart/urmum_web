require 'spec_helper'

describe "The urmum api" do
  def app
    Sinatra::Application
  end

  describe "post api" do
    subject (:post_api) { post "/api", { text: "noun", user_name: "bob" } }
    it { should be_ok }

    it "should return a string" do
      post_api
      expect(JSON(last_response.body)).to eq({ "text" => "bob: You're a noun" })
    end

    it "handles input with quotes" do
      post "/api", { text: "You're a noun", user_name: "bob" }
      expect(JSON(last_response.body)).to eq({ "text" => "bob: Your face is a noun" })
    end

    it "handles empty usernames" do
      post "/api", { text: "noun" }
      expect(JSON(last_response.body)).to eq({ "text" => "I say: You're a noun" })
    end
  end
end
