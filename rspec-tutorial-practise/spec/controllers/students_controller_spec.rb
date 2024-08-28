require 'rails_helper'

RSpec.describe StudentsController do
  describe 'GET index' do
    let(:student) { create :student }

    before(:each) do
      sign_in(student)
      get :index
    end

    it 'assigns @students' do
      expect(assigns(:students)).to eq([student])
    end

    it 'render index template' do
      expect(response).to render_template('index')
    end

    it 'return success ok http code' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST index' do
    let(:student) { create :student }

    before(:each) do
      sign_in(student)
    end

    it 'should accept the params  with html formats' do
      post :create, params: {
        student: student_params
      }
      expect(response.media_type).to eq('text/html')
      expect(response.content_type).to eq('text/html; charset=utf-8')
    end

    # it 'should accept the params with turbo_strem format' do
    #   post :create, params: {
    #     student: student_params,
    #     format: turbo_stream
    #   }
    #   expect(response.media_type).to eq('text/html')
    #   expect(response.content_type).to eq('text/html; charset=utf-8')
    # end

    it 'should redirect to showpage  with html format' do
      post :create, params: {
        student: student_params
    }
      expect(response).to redirect_to(assigns(:student))
    end

    # it 'should render the student partial with turbo_stream format' do
    #   post :create, params: {
    #     student: student_params,
    #     format: :turbo_stream
    #   }
    #   debugger
    #   expect(subject).to render_template('index')
    # end

    def student_params
      {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: 'password123',
        password_confirmation: 'password123',
        contact_no: Faker::Number.number(digits: 10),
        city: 'Surat',
        state: 'Gujarat',
        country: Student.country_code_list.sample
      }
    end
  end
end
