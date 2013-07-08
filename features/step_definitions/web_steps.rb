Then(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in(field, with: value)
end

Then(/^I press "(.*?)"$/) do |button|
  click_button(button)
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content(text)
end

When(/^I follow "(.*?)"$/) do |link|
  click_link link
end

When(/^I follow image link with "(.*?)"$/) do |selector|
  find(:xpath, "//a[@id='#{selector}']").click
end
