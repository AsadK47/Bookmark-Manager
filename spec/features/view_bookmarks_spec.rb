feature "Viewing bookmarks" do

  feature "Visiting the homepage" do
    scenario "It shows the bookmark button" do
      visit '/'
      expect(page).to have_content "Bookmark Manager"
    end
  end

  feature "Bookmarks" do
    scenario "It shows the the list of bookmarks" do
      visit '/bookmarks'

      Bookmark.create(url: 'http://www.google.com', title: 'Google')
      Bookmark.create(url: 'http://www.youtube.com', title: 'Youtube')
      Bookmark.create(url: 'http://www.apple.com', title: 'Apple')

      visit '/bookmarks'

      expect(page).to have_link('Google', href: "http://www.google.com")
      expect(page).to have_link('Youtube', href: "http://www.youtube.com")
      expect(page).to have_link('Apple', href: "http://www.apple.com")
    end
  end

end
