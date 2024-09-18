Given('I am on the students page') do
  visit '/'
end

When('I click on {string}') do |link|
  click_link link
end

When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value
end


When('I select {string} from {string}') do |option, field|
  select option, from: field
end


When('I press {string}') do |button|
  click_button button
end

Then('I should see {string}') do |text|
  expect(page).to have_content(text)
end

Given('the following students exist:') do |table|
  table.hashes.each do |student|
    existing_student = Student.find_by(email: student['email'])
    next if existing_student

    Student.create!(
      first_name: student['first_name'],
      last_name: student['last_name'],
      email: student['email'],
      password: student['password'],
      password_confirmation: student['password_confirmation'],
      birthdate: student['birthdate'],
      contact_no: student['contact_no'],
      city: student['city'],
      state: student['state'],
      country: student['country']
    )
  end
end

When('I visit the student\'s page for {string}') do |full_name|
  first_name, last_name = full_name.split(' ')
  student = Student.find_by(first_name: first_name, last_name: last_name)
  visit '/'
end


When('I visit the student\'s edit page for {string}') do |full_name|
  first_name, last_name = full_name.split(' ')
  student = Student.find_by(first_name: first_name, last_name: last_name)
  visit "main/students/#{student.id}/edit"
  # expect(page).to have_selector('form')
end

When('I click the {string} button') do |button|
  click_button button
end

Then('I should see the updated student\'s details:') do |table|
  updated_student = Student.find_by(first_name: 'Johnny', last_name: 'Doee')
  
  table.rows_hash.each do |field, expected_value|
    actual_value = updated_student.send(field)
    expect(actual_value).to eq(expected_value)
  end
end

When('I click on "Delete"') do
  click_link 'Delete'
end

Then('I should not see {string}') do |text|
  expect(page).not_to have_content(text)
end
