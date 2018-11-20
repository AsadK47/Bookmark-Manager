feature "Bookmarks" do
  scenario "It shows the the list of bookmarks" do
    visit '/'
    click_button "View"
    visit '/bookmarks'
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.youtube.com"
    expect(page).to have_content "http://www.apple.com"
  end
end
