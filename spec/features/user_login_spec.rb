require 'rails_helper'

RSpec.feature "User is successfully logged in and taken to the home page", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create! first_name: 'Anna', last_name: 'Karenina', email: 'karenina@email.com', password: 'vronskiy', password_confirmation: 'vronskiy'
  end

    scenario "User loggs in" do
      # ACT
      visit "login"
      expect(page).to have_css("div#navbar", text: "Login")
      expect(page).to have_selector 'form'
      save_screenshot('login.png')

      fill_in 'inputEmail', with: 'karenina@email.com'
      fill_in 'inputPassword', with: 'vronskiy'
      click_button 'Submit'

      # DEBUG
      save_screenshot('after_login.png')

      # # VERIFY

      # waits for the sign in page to disappear and open home page
      expect(page).to have_no_content("Wait for the text which is available in the log in page but not on next page")
      expect(page).to have_css("div#navbar", text: "Logout")
    end
  end
