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

Given('the following student exist:') do |table|
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
  expect(student).not_to be_nil, "Student with name '#{full_name}' not found."
  visit student_path(student) # Ensure this matches your routes
end

Given('I am logged in as {string}') do |email|
  student = Student.find_by(email: email)
  login_as(student, scope: :student) 
end

When('I visit the student\'s edit page for {string}') do |full_name|
  first_name, last_name = full_name.split(' ')
  student = Student.find_by(first_name: first_name, last_name: last_name)
  visit edit_student_path(student) # Ensure this matches your routes
end

When('I enter {string} into the {string} field') do |value, field_label|
  fill_in field_label, with: value
end

When('I visit the student\'s page') do
  visit '/'
end

# When('I click on the "Delete" button') do
#   if ENV['SKIP_RSPEC']
#     skip 'Skipping RSpec test'
#   else
#     click_button 'Delete'
#   end
# end

When('I press "Delete" for {string}') do |student_name|
  within('.table') do
    within('.student_data', text: student_name) do
      click_button 'Delete'
    end
  end
end

Then('I should not see {string} in the table') do |student_name|
  expect(page).not_to have_content(student_name)
end
