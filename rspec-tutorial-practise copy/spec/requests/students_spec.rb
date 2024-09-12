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
      expect(response.body).to include('Students')  
    end
  end

  describe "GET /students/:id" do
    it "should return the student details" do
      get student_path(student)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(student.first_name, student.last_name, student.email)    
    end
  end

  describe "POST/ students" do
    context "with valid parameters" do
        let(:valid_attributes){ attributes_for(:student)}
          it 'create new student' do
            post students_path, params: {
              student: attributes_for(:student)
              }
            expect(Student.count).to eq(2)  
          end

    # it 'should redirect to new students page' do
    #   post students_path, params: { student: valid_attributes  }
    #   expect(response).to redirect_to(student_path(Student.last))
    #   # follow_redirect!
    #   expect(response.body).to include("Student was successfully created!")  
    # end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { attributes_for(:student, first_name: "") }

          it "does not create a new student" do
            post students_path, params: { student: invalid_attributes}
            expect(Student.count).to  eq(1) 
          end

          # it "renders the new template" do
          #   post students_path, params: { student: invalid_attributes }
          #   expect(response).to have_http_status(:unprocessable_entity)
          #   expect(response.body).to include( "New Student" )
          # end
    end

  end

  describe  'Create Student' do
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

  describe "PATCH /students/:id" do
    context "with valid parameters" do
      let(:new_attributes) { { first_name: "Updated" } }

      it "updates the student" do
        patch student_path(student), params: { student: new_attributes }
        student.reload
        expect(student.first_name).to eq("Updated")
      end

      it "redirects to the student's show page" do
        patch student_path(student), params: { student: new_attributes }
        expect(response).to redirect_to(student_path(student))
        follow_redirect!
        expect(response.body).to include("Student was successfully updated.")
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { first_name: "" } }

      it "does not update the student" do
        patch student_path(student), params: { student: invalid_attributes }
        student.reload
        expect(student.first_name).not_to eq("")
      end

      it "renders the edit template" do
        patch student_path(student), params: { student: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Edit Student")
      end
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

  describe "DELETE /students/:id" do
    it "deletes the student" do
      delete student_path(Student.last)
      expect(Student.count).to  eq(0) 
    end

    it "redirects to the students index" do
      delete student_path(student)
      expect(response).to redirect_to(students_path)
      # follow_redirect!
      # expect(response.body).to include("Student '#{student.full_name}' was successfully deleted.")
    end
  end







end