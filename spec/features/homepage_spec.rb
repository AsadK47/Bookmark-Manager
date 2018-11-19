feature "Homepage" do
  scenario "It shows the bookmark button" do
    visit '/'
    expect(page).to have_button "View"
  end
end
