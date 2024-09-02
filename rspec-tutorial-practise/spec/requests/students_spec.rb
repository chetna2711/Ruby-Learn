require 'rails_helper'

RSpec.describe "Students", type: :request do
  
  let(:student) {create :student}

  before(:each) do
    sign_in(student)
  end

  describe "GET /students" do
    it "should return status code 200" do
      get students_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'Create Student' do
    it 'should render the new form and data save into the database' do
      get new_student_path(format: :html)
       expect(response).to render_template('students/new')

      post students_path, params: {
         student: {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: 'password123',
        password_confirmation: 'password123',
        birthdate: '27/11/2001',
        contact_no: Faker::Number.number(digits: 10),
        city: 'Surat',
        state: 'Gujarat',
        country: Student.country_code_list.sample
      }
    }

      expect(response.media_type).to eq('text/html')
      expect(response.content_type).to eq('text/html; charset=utf-8')   
      expect(Student.count).to eq(2)  
      expect(response).to redirect_to(student_path(Student.last))
    end
  end

  describe 'Update Student' do
    let(:student1) { create :student }
    it 'should render the edit student form and then update the data into the database' do
      get edit_student_path(student1, format: :html)
       expect(response).to render_template('students/edit')

      patch student_path(student1), params: {
         student: {
        first_name: 'Updated Name',
        contact_no: 9523687451,
      }
    }
      expect(response.media_type).to eq('text/html')
      expect(response.content_type).to eq('text/html; charset=utf-8')   
      expect(Student.count).to eq(2)  
      expect(response).to redirect_to(student_path(Student.last))
      expect(assigns[:student].first_name).to  eq('Updated Name')
      expect(assigns[:student].contact_no).to  eq(9523687451)
    end
  end


end
