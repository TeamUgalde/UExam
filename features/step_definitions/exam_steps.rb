
When(/^I click the "(.*?)" link of the first exam$/) do |action|
  className = ".#{action}-link"
  first(className).click_link(action)
end


When(/^I click the Destroy link of the second exam$/) do
  destroyLinks = page.all('.Destroy-link')
  destroyLinks[2].click_link('Destroy')
end

