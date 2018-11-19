feature "View" do
  scenario "It shows the the list of bookmarks" do
    visit '/'
    click_button "View"
    expect(page).to have_content "[Bookmark 1] [Bookmark 2]"
  end
end
