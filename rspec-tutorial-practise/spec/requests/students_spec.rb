require 'rails_helper'

RSpec.describe "Students", type: :request do
  
  let(:student) {create :student}

  before(:each) do
    sign_in(student)
  end

  describe "GET /students" do
    it "works! (now write some real specs)" do
      get students_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'Create Student' do
    it 'should render the new form and data save into the database' do
      get new_student_path(format: :html)
       expect(response).to render_template('students/new')
    end
  end


end
