feature "delete" do
  scenario "it deletes a bookmark" do
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    visit('/bookmarks')
    expect(page).to have_link('Google', href: 'http://www.google.com')
    p "hello"
    first('.bookmark').click_button('Delete')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Google', href: 'http://www.google.com')
  end
end