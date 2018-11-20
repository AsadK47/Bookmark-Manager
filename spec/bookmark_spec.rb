require "bookmark"

describe Bookmark do

  describe "#View" do
    it "Shows the list of bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.youtube.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.apple.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include "http://www.google.com"
      expect(bookmarks).to include "http://www.youtube.com"
      expect(bookmarks).to include "http://www.apple.com"
    end
  end

end
