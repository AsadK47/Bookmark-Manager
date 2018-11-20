require "bookmark"

describe Bookmark do

  describe "#View" do
    it "Shows the list of bookmarks" do
      bookmarks = Bookmark.all

      expect(bookmarks).to include "http://www.google.com"
      expect(bookmarks).to include "http://www.youtube.com"
      expect(bookmarks).to include "http://www.apple.com"
    end
  end

end
