# cappybara test behavior and user experience. cappybara generally tests frontend code. whereas respec genereally tests backend. see models spec for database tests.
require 'rails_helper'

RSpec.feature "RegisterUsers", type: :feature do
  context "When i visit a welcome page" do


    #Story: As an internet user, I can go to a web site
    it "can go to a webpage that shows Registration Form" do
      visit '/welcome/index'
      expect(page).to have_content("Registration Form")
    end

    #I am presented with a registration form
    it "can present with a registration form and input user information" do
      visit '/welcome/index'
      expect(page).to have_content("Registration Form")
      fill_in("first_name", with: "Christina")
      fill_in("last_name", with: "Buster")
      fill_in("street_address", with: "123 strawberry st.")
      fill_in("city", with: "blueberry")
      fill_in("state", with: "Ch")
      fill_in("zip_code", with: "93240")
      fill_in("country", with: "USA")
      fill_in("phone1", with: "1234567")
      fill_in("phone2", with: "5556666")
      fill_in("phone3", with: "7778989")
      fill_in("email", with: "Christina@gmail.com")
      fill_in("user_name", with: "cbuster")
      fill_in("password", with: "happy")
      expect(page).to have_field("first_name", with: "Christina")
      expect(page).to have_field("last_name", with: "Buster")
      expect(page).to have_field("street_address", with: "123 strawberry st.")
      expect(page).to have_field("city", with: "blueberry")
      expect(page).to have_field("state", with: "Ch")
      expect(page).to have_field("zip_code", with: "93240")
      expect(page).to have_field("country", with: "USA")
      expect(page).to have_field("phone1", with: "1234567")
      expect(page).to have_field("phone2", with: "5556666")
      expect(page).to have_field("phone3", with: "7778989")
      expect(page).to have_field("email", with: "Christina@gmail.com")
      expect(page).to have_field("user_name", with: "cbuster")
      expect(page).to have_field("password", with: "happy")

    end

    #where user ID and password are required
    it "can test that user name and password are required" do
      visit '/welcome/index'
      expect(page).to have_content("Registration Form")
      #fills in field with an empty string, and clicks button
      fill_in('user_name', with: "")
      fill_in('password', with: "")
      click_button 'submit'
      #expects to be redirected to same page
      expect(page).to have_content("Registration Form")
      #maybe a flash? saying user name and password are required
    end

    # tests that the information entered into the registration form is sumbited to the database when the sumbit button is clicked.
    #fills in user name and password to test functionality
    # expect register page to have conent of user information
    it "can send information to be entered into database" do
      visit '/welcome/index'
      fill_in("first_name", with: "Christina")
      fill_in("last_name", with: "Buster")
      fill_in("street_address", with: "123 strawberry st.")
      fill_in("city", with: "blueberry")
      fill_in("state", with: "Ch")
      fill_in("zip_code", with: "93240")
      fill_in("country", with: "USA")
      fill_in("phone1", with: "1234567")
      fill_in("phone2", with: "5556666")
      fill_in("phone3", with: "7778989")
      fill_in("email", with: "Christina@gmail.com")
      fill_in("user_name", with: "cookie")
      fill_in("password", with: "1234")

      expect(page).to have_field("first_name", with: "Christina")
      expect(page).to have_field("last_name", with: "Buster")
      expect(page).to have_field("street_address", with: "123 strawberry st.")
      expect(page).to have_field("city", with: "blueberry")
      expect(page).to have_field("state", with: "Ch")
      expect(page).to have_field("zip_code", with: "93240")
      expect(page).to have_field("country", with: "USA")
      expect(page).to have_field("phone1", with: "1234567")
      expect(page).to have_field("phone2", with: "5556666")
      expect(page).to have_field("phone3", with: "7778989")
      expect(page).to have_field("email", with: "Christina@gmail.com")
      expect(page).to have_field("user_name", with: "cookie")
      expect(page).to have_field("password", with: "1234")
      #clicks button and expects to go to the welcome/register
      click_button 'submit'
      expect(page).to have_content("User Information")
      expect(page).to have_content("Christina")
      expect(page).to have_content("Buster")
      expect(page).to have_content("123 strawberry st.")
      expect(page).to have_content("blueberry")
      expect(page).to have_content("Ch")
      expect(page).to have_content("93240")
      expect(page).to have_content("USA")
      expect(page).to have_content("1234567")
      expect(page).to have_content("5556666")
      expect(page).to have_content("7778989")
      expect(page).to have_content("Christina@gmail.com")
      expect(page).to have_content("cookie")
      expect(page).to have_content("1234")
    end

    # test for null when data field is empty. ((see model and controller rspec))
    # it "should show null in the database when the user has not input information for the specific field" do
    #   visit '/welcome/index'
    #   fill_in('first_name', with: "")
    #   expect(page).to have_field("first_name", with: "")
    #   click_button 'submit'
    #   expect(page).to have_field("first_name", with: "nil")
    # end

    # As an registered user, I can login into the web site by providing user ID and password. If log in is successful, I am taken to a page saying "Hello <user ID>".
    #   Hint: Use POST for the form
    #   Hint: Store user ID in session when successfully logged in.

    it "should show login" do
      visit '/welcome/record'
      fill_in("user_name", with: "cookie")
      fill_in("password", with: "1234")
      #clicks button and expects to go to the welcome/register
      click_button 'submit'
      expect(page).to have_content("session")
      expect(page).to have_content("1234")
    end

  #the content end
  end
#the final
end
