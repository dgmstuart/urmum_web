require 'spec_helper'

describe "The urmum site" do
  def app
    Sinatra::Application
  end

  describe "get index" do
    subject (:get_index) { get '/' }
    it { is_expected.to be_ok }
    it "should render a form" do
      get_index
      expect(last_response.body).to include(%{<form action='/' method='post'>})
    end
  end
  describe "post index" do
    context "when the post input is not nil" do
      subject (:post_fish) { post '/', input: 'fish' }
      it { is_expected.to be_ok }
      it "should include a reply as a string" do
        post_fish
        expect(last_response.body).to match(/<p class='reply'>.+<\/p>/)
      end
    end
    context "when the post input is nil" do
      subject (:post_nothing) { post '/' }
      it "should be ok" do
        post_nothing
        expect(last_response.status).to eq 200
      end
      it "should not include a reply as a string" do
        post_nothing
        expect(last_response.body).to_not match(/<p class='reply'>.+<\/p>/)
      end
    end
  end
end
