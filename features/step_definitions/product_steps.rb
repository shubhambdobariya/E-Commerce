Given('I am on the new product page') do
    visit new_product_path
  end
  
  When('I fill in {string} with {string}') do |field, value|
    fill_in field, with: value
  end
  
  When('I select {string} from {string}') do |value, field|
    select value, from: field
  end
  
  When('I press {string}') do |button|
    click_button button
  end
  
  Then('I should see {string}') do |text|
    expect(page).to have_content(text)
  end
  
  Then('I should see {string} # price after increment') do |price|
    expect(page).to have_content(price)
  end
  