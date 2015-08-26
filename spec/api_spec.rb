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
      expect(last_response.body).to eq(%{You're a noun})
    end

    it "handles input with quotes" do
      post "/api", { text: "You're a noun" }
      expect(last_response.body).to eq(%{Your face is a noun})
    end
  end
end
