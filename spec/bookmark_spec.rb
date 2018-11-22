require 'bookmark'
require 'features/database_helpers.rb'

describe Bookmark do

  describe "#View" do
    it "Shows the list of bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
      Bookmark.create(url: 'http://www.youtube.com', title: 'Youtube')
      Bookmark.create(url: 'http://www.apple.com', title: 'Apple')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'http://www.google.com'
    end
  end

  describe "#.create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe "#.delete" do
    it "deletes the bookmark" do
      bookmark = Bookmark.create(title: 'Google', url: 'http://www.google.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe "#.update" do
    it "updates the bookmark successfully" do
      bookmark = Bookmark.create(title: 'Google', url: 'http://www.google.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end

end
