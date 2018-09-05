require 'watir-webdriver'
require 'cucumber'
require 'selenium-webdriver'
require 'capybara'

When(/^user navigates to registration page$/) do
  driver = Selenium::WebDriver.for :firefox
  @browser = Watir::Browser.new(driver)
  @browser.goto "https://shrouded-lowlands-66853.herokuapp.com/"
  pending
end

When(/^user fills all fields except First Name$/) do
  @browser.text_field(:id => "user_last_name").set "Mcgoo"
  @browser.select_list(:id, "user_suffix").option(value => "RN").set
  @browser.text_field(:id => "user_title").set "Sir"
  @browser.text_field(:id => "user_email").set "squishy@foo.goo"
  @browser.text_field(:id => "user_phone_number").set "8085551234"
  @browser.text_field(:id => "user_business_name").set "WidgetCo"
  @browser.text_field(:id => "user_address_1").set "978 Stannage Ave"
  @browser.text_field(:id => "user_address_2").set "upstairs"
  @browser.text_field(:id => "user_city").set "Alameda"
  @browser.select_list(:id, "user_state").option(value => 'CA').set
  @browser.text_field(:id => "user_zip").set "94704"
  @browser.checkbox(:id => "user_agree_1").set
  @browser.checkbox(:id=> "user_agree_2").set
  pending
end

And(/^user selects Save User button$/) do
  @browser.select(name:"commit")
  pending
end

And(/^user enters (\d+) characters in First Name field$/) do
  @browser.text_field(:id => "user_first_name").set "FairyPrincessAce"
  pending
end

When(/^user fills all fields with valid data$/) do
  @browser.text_field(:id => "user_first_name").set "Reginald"
  @browser.text_field(:id => "user_last_name").set "Mcgoo"
  @browser.select_list(:id, "user_suffix").option(value => "RN").set
  @browser.text_field(:id => "user_title").set "Sir"
  @browser.text_field(:id => "user_email").set "squishy@foo.goo"
  @browser.text_field(:id => "user_phone_number").set "8085551234"
  @browser.text_field(:id => "user_business_name").set "WidgetCo"
  @browser.text_field(:id => "user_address_1").set "978 Stannage Ave"
  @browser.text_field(:id => "user_address_2").set "upstairs"
  @browser.text_field(:id => "user_city").set "Alameda"
  @browser.select_list(:id, "user_state").option(value => 'CA').set
  @browser.text_field(:id => "user_zip").set "94704"
  @browser.checkbox(:id => "user_agree_1").set
  @browser.checkbox(:id=> "user_agree_2").set
  pending
end

When(/^user fills all fields except Title$/) do
  @browser.text_field(:id => "user_first_name").set "Reginald"
  @browser.text_field(:id => "user_last_name").set "Mcgoo"
  @browser.select_list(:id, "user_suffix").option(value => "RN").set
  @browser.text_field(:id => "user_email").set "squishy@foo.goo"
  @browser.text_field(:id => "user_phone_number").set "8085551234"
  @browser.text_field(:id => "user_business_name").set "WidgetCo"
  @browser.text_field(:id => "user_address_1").set "978 Stannage Ave"
  @browser.text_field(:id => "user_address_2").set "upstairs"
  @browser.text_field(:id => "user_city").set "Alameda"
  @browser.select_list(:id, "user_state").option(value => 'CA').set
  @browser.text_field(:id => "user_zip").set "94704"
  @browser.checkbox(:id => "user_agree_1").set
  @browser.checkbox(:id=> "user_agree_2").set
  pending
end

And(/^user enters Title value with numbers$/) do
  @browser.text_field(:id => "user_title").set "agent007"
  pending
end

And(/^user enters Title value with alpha and space characters$/) do
  @browser.text_field(:id => "user_title").set "agent deuce"
  pending
end

Then(/^registration page displays$/) do
  puts "A01 - Pass" if wait.until {/Register New User/.match(browser.page_source)}
  pending
end

Then(/^page displays "([^"]*)" error$/) do
  puts "A02 - Pass" if wait.until {/First name cannot be blank/.match(browser.page_source)}
  pending
end

Then(/^Success page displays$/) do
  puts "A04 & A05 - Pass" if wait.until {/Success/.match(browser.page_source)}
  pending
end

And(/^no error messages displayed$/) do
  puts "No error displayed" if wait.until {!/Error/.match(browser.page_source)}
  pending
end

Then(/^only (\d+) characters remain in First Name field$/) do
  expect(find('#element_id').value.length).to eq(15)
  pending
end