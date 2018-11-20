feature "Bookmarks" do
  scenario "It shows the the list of bookmarks" do
    visit '/'
    click_button "View"

    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.youtube.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.apple.com');")

    visit '/bookmarks'

    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.youtube.com"
    expect(page).to have_content "http://www.apple.com"
  end
end
