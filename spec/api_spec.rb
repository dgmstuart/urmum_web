require 'spec_helper'

describe "The urmum api" do
  def app
    Sinatra::Application
  end

  describe "get api" do
    subject (:get_api) { get "/api?input=noun" }
    it { should be_ok }

    it "should return a string" do
      get_api
      expect(last_response.body).to eq(%{You're a noun})
    end

    it "handles input with quotes" do
      get "/api?input=You're a noun"
      expect(last_response.body).to eq(%{Your face is a noun})
    end
  end
end
