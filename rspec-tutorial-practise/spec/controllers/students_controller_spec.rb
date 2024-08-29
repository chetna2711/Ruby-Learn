require 'rails_helper'

RSpec.describe StudentsController do
  # --------------------------------------- Writing controller spec for GET  Action ---------------------------------------------

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

  # --------------------------------------- Writing controller spec for POST  Action ---------------------------------------------
  describe 'POST create' do
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
      expect(subject).to redirect_to(assigns(:student))
    end

 #  it 'should redirect to showpage  with turbo_stream format' do
    #   post :create, params: {
    #     student: student_params 
    #   }
    #   expect(subject).to redirect_to(assigns(:student))
    # end

    it 'should render the student partial with html format' do
      post :create, params: {
        student: student_params,
      }
      expect(subject).to render_template('index')
    end
    #   post :create, params: {
    #     student: student_params,
    #     format: :turbo_stream
    #   }
    #   expect(subject).to redirect_to(assigns(:student))
    # end

    # it 'should render the student partial with turbo_stream format' do
    #   post :create, params: {
    #     student: student_params,
    #     format: :turbo_stream
    #   }
    #   expect(subject).to render_template('index')
    # end

    it 'should renders validation error into form' do
        post :create, params: {
          student: {
            first_name: nil,
            last_name: nil,
            email: Faker::Internet.email,
            password: 'password123',
            password_confirmation: 'password123',
            birthdate: '27/11/2001',
            contact_no: Faker::Number.number(digits: 10),
            city: 'Surat',
            state: 'Gujarat',
            country: Student.country_code_list.sample
          },
        }
        expect(assigns(:student).valid?).not_to eq(true)
        expect(response).to render_template('devise/registrations/new')
      end
      
    # it 'should renders validation error into form' do
    #   post :create, params: {
    #     student: {
    #       first_name: nil,
    #       last_name: nil,
    #       email: Faker::Internet.email,
    #       password: 'password123',
    #       password_confirmation: 'password123',
    #       birthdate: '27/11/2001',
    #       contact_no: Faker::Number.number(digits: 10),
    #       city: 'Surat',
    #       state: 'Gujarat',
    #       country: Student.country_code_list.sample
    #     },
    #     format: :turbo_stream
    #   }
    #   debugger
    #   expect(assigns(:student).valid?).not_to eq(true)
    #   expect(response).to render_template('students/_error_messages')
    # end

    it 'should includes the error messages for empty attributes' do
      post :create, params: {
        student: {
          first_name: nil,
          last_name: nil,
          email: nil,
          password: 'password123',
          password_confirmation: 'password123',
          birthdate: '27/11/2001',
          contact_no: Faker::Number.number(digits: 10),
          city: 'Surat',
          state: 'Gujarat',
          country: Student.country_code_list.sample
        },
      }
      expect(assigns(:student).valid?).not_to eq(true)
      expect(response).to render_template(:new)
      expect(assigns(:student).errors.full_messages).to include("Email can't be blank", "First name can't be blank",
                                                                "Last name can't be blank")
    end

   # it 'should includes the error messages for empty attributes' 

    it 'should includes the uniqness error in form' do
      post :create, params: {
        student: {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: student.email,
          password: 'password123',
          password_confirmation: 'password123',
          birthdate: '27/11/2001',
          contact_no: Faker::Number.number(digits: 10),
          city: 'Surat',
          state: 'Gujarat',
          country: Student.country_code_list.sample
        },
      }
      expect(assigns(:student).valid?).not_to eq(true)
      expect(response).to render_template('devise/registrations/new')
      expect(assigns(:student).errors.full_messages).to include('Email has already been taken')
    end
    #   post :create, params: {
    #   student: {
    #     first_name: nil,
    #     last_name: nil,
    #     email: nil,
    #     password: 'password123',
    #     password_confirmation: 'password123',
    #     birthdate: '27/11/2001',
    #     contact_no: Faker::Number.number(digits: 10),
    #     city: 'Surat',
    #     state: 'Gujarat',
    #     country: Student.country_code_list.sample
    #   },
    #   format: :turbo_stream
    #   }
    #   expect(assigns(:student).valid?).not_to eq(true)
    #   expect(response).to render_template(:new)
    #   expect(assigns(:student).errors.full_messages).to include("Email can't be blank", "First name can't be blank", "Last name can't be blank")
    # end

    # it 'should includes the uniqness error in form' do
    # post :create, params: {
    #   student: {
    #     first_name: Faker::Name.first_name,
    #     last_name:Faker::Name.last_name,
    #     email: student.email,
    #     password: 'password123',
    #     password_confirmation: 'password123',
    #     birthdate: '27/11/2001',
    #     contact_no: Faker::Number.number(digits: 10),
    #     city: 'Surat',
    #     state: 'Gujarat',
    #     country: Student.country_code_list.sample
    #   },
    # format: :turbo_stream
    #   }
    #   expect(assigns(:student).valid?).not_to eq(true)
    #   expect(response).to render_template(:new)
    #   expect(assigns(:student).errors.full_messages).to include("Email has already been taken")
    # end
  end

  # --------------------------------------------- Writing controller spec for PATCH Action-------------------------------------------------------------
  
  describe 'PATCH Update' do
    let(:student) { create :student }
    let(:student1) { create :student }
    let(:student2) { create :student }

    before(:each) do
      sign_in(student)
    end

    it 'should accept the params  with html formats' do
      patch :update, params: {
        student: student_params,
        id: student1.id,
      }
      expect(response.media_type).to eq('text/html')
      expect(response.content_type).to eq('text/html; charset=utf-8')
    end

    # it 'should accept the params with turbo_strem format' do
    #   patch :update , params: {
    #     student: student_params,
    #     id: student1.id,
    #     format: turbo_stream
    #   }
    #   expect(response.media_type).to eq('text/html')
    #   expect(response.content_type).to eq('text/html; charset=utf-8')
    # end

    it 'should redirect to showpage  with html format' do
      patch :update, params: {
        student: student_params,
        id: student2.id,
      }
      expect(response).to redirect_to(assigns(:student))
    end

    #   patch :update, params: {
    #     student: student_params,
    #     id: student2.id,
    #     format: turbo_stream
    #   }
    #   expect(response).to redirect_to(assigns(:student))
    # end

    # it 'should render the student partial with turbo_stream format' do
    #   patch :update, params: {
    #     student: student_params,
    #     id: student2.id,
    #     format: :turbo_stream
    #   }
    #   expect(response).to render_template('index')
    # end
    
     it 'should render the student partial with html format' do
      patch :update, params: {
        student: student_params,
        id: student2.id,
      }
      expect(subject).to redirect_to(assigns(:student))
    end

    # it 'should render the student partial with turbo_stream format' do
    #   patch :update, params: {
    #     student: student_params,
    #     id: student2.id,
    #     format: :turbo_stream
    #   }
    #   expect(response).to render_template('index')
    # end 

    # it 'should renders validation error into form turbo_stream' do
    #  patch :update, params: {
    #     student: {
    #       first_name: nil,
    #       last_name: nil,
    #       email: Faker::Internet.email,
    #       password: 'password123',
    #       password_confirmation: 'password123',
    #       birthdate: '27/11/2001',
    #       contact_no: Faker::Number.number(digits: 10),
    #       city: 'Surat',
    #       state: 'Gujarat',
    #       country: Student.country_code_list.sample
    #     },
    #     id: student2.id,
    #     format: :turbo_stream
    #   }
    #   expect(assigns(:student).valid?).not_to eq(true)
    #   expect(response).to render_template('students/_error_messages')
    # end


    it 'should renders validation error into form ' do
     patch :update, params: {
        student: {
          first_name: nil,
          last_name: nil,
          email: Faker::Internet.email,
          password: 'password123',
          password_confirmation: 'password123',
          birthdate: '27/11/2001',
          contact_no: Faker::Number.number(digits: 10),
          city: 'Surat',
          state: 'Gujarat',
          country: Student.country_code_list.sample
        },
        id: student2.id,
        
      }
      expect(assigns(:student).valid?).not_to eq(true)
      expect(response).to render_template('devise/registrations/edit')
    end
  
    it 'should includes the error messages for empty attributes' do
      patch :update, params: {
        student: {
          first_name: nil,
          last_name: nil,
          email: nil,
          password: 'password123',
          password_confirmation: 'password123',
          birthdate: '27/11/2001',
          contact_no: Faker::Number.number(digits: 10),
          city: 'Surat',
          state: 'Gujarat',
          country: Student.country_code_list.sample
        },
        id: student1.id,
      }
      expect(assigns(:student).valid?).not_to eq(true)
      expect(response).to render_template('devise/registrations/edit')
      expect(assigns(:student).errors.full_messages).to include("Email can't be blank", "First name can't be blank",
                                                                "Last name can't be blank")
    end

    it 'should includes the uniqness error in form' do
      patch :update, params: {
        student: {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: student.email,
          password: 'password123',
          password_confirmation: 'password123',
          birthdate: '27/11/2001',
          contact_no: Faker::Number.number(digits: 10),
          city: 'Surat',
          state: 'Gujarat',
          country: Student.country_code_list.sample
        },
        id: student1.id,
      }
      expect(assigns(:student).valid?).not_to eq(true)
      expect(response).to render_template('devise/registrations/edit')
      expect(assigns(:student).errors.full_messages).to include('Email has already been taken')
    end

    # it 'should includes the error messages for empty attributes' do
    #  patch :update, params: {
    #   student: {
    #     first_name: nil,
    #     last_name: nil,
    #     email: nil,
    #     password: 'password123',
    #     password_confirmation: 'password123',
    #     birthdate: '27/11/2001',
    #     contact_no: Faker::Number.number(digits: 10),
    #     city: 'Surat',
    #     state: 'Gujarat',
    #     country: Student.country_code_list.sample
    #   },
    #   format: :turbo_stream
    #   }
    #   expect(assigns(:student).valid?).not_to eq(true)
    #   expect(response).to render_template(:new)
    #   expect(assigns(:student).errors.full_messages).to include("Email can't be blank", "First name can't be blank", "Last name can't be blank")
    # end

    # it 'should includes the uniqness error in form' do
    #  patch :update, params: {
    #   student: {
    #     first_name: Faker::Name.first_name,
    #     last_name:Faker::Name.last_name,
    #     email: student.email,
    #     password: 'password123',
    #     password_confirmation: 'password123',
    #     birthdate: '27/11/2001',
    #     contact_no: Faker::Number.number(digits: 10),
    #     city: 'Surat',
    #     state: 'Gujarat',
    #     country: Student.country_code_list.sample
    #   },
    # format: :turbo_stream
    #   }
    #   expect(assigns(:student).valid?).not_to eq(true)
    #   expect(response).to render_template(:new)
    #   expect(assigns(:student).errors.full_messages).to include("Email has already been taken")
    # end
  end

  describe 'DELETE destroy'
      let(:student) { create(:student)}
      let(:student1) { create(:student)}

      before(:each) do
        sign_in(student)
      end
    
      it 'should reduce the student count by one' do
          delete :destroy, params:{
            id: student1.id
          }
          expect(Student.count).to eq(1)  
      end

      
  end



def student_params
  {
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
end