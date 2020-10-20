require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(name: 'James', email: 'test@test.com', password: 'admin1234',
    password_confirmation: 'admin1234')
  end

  scenario "User is able to log in" do
    visit '/login'

    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button "Submit"

    save_screenshot

    expect(page).to have_content("Signed in as: #{@user.name}")

    click_link 'Logout'

    expect(page).to have_content("Login")
  end

end
