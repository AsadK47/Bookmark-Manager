feature "Add" do
  scenario "You are able to add bookmarks" do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testingbookmark.com')
    click_button('Submit')
    expect(page).to have_content 'http://www.testingbookmark.com'
  end
end
