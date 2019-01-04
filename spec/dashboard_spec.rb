require "spec_helper"
require "dashboard"

describe Dashboard do
  describe "#posts" do
    it "returns posts created today" do
      today_s_posts = double("published posts")
      allow(Post).to receive(:today).and_return(today_s_posts)
      dashboard = Dashboard.new(posts: Post.all)

      result = dashboard.todays_posts

      expect(result).to eq(today_s_posts)
    end
  end

  around do |example|
    Timecop.freeze { example.run }
  end
end
