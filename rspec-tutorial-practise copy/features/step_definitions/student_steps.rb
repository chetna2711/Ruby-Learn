    Given('I am on the new student page') do
      visit '/students/sign_up'
    end

    When('I fill in {string} with {string}') do |field, value|
      fill_in field, with: value

      if field == 'birthdate'
        fill_in field, with: value, visible: false 
      else
        fill_in field, with: value
      end
    end



    When('I select {string} from {string}') do |option, field|
      select option, from: field
    end

    When('I press {string}') do |button|
      click_button button
    end

    Then('I should see {string}') do |message|
      expect(page).to have_content(message)
    end
