require "rails_helper"

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      student1 = Student.create!(
        first_name: "Slicer",
        last_name: "Dicer",
        email: "slicer123@gmail.com",
        password: "password123",
        birthdate: "2005-05-02",
        contact_no: "9874563215",
        city: "Surat",
        state: "Gujarat",
        country: "IN"
      ),
     student2 = Student.create!(
        first_name: "John",
        last_name: "Doe",
        email: "joendoe123@example.com",
        password: "password123",
        birthdate: "2004-02-01",
        contact_no: "5263987412",
        city: "Ahmedabad",
        state: "Gujarat",
        country: "IN"
      )
    ])
  end

       # View specs render the described view file
        # it "displays all the students" do
        #   render

        #   expect(rendered).to match(/student1.first_name/)
        #   expect(rendered).to match(/Dicer/)
        #   expect(rendered).to match(/slicer123@gmail.com/)
        #   expect(rendered).to match(/May 02, 2005/)
        #   expect(rendered).to match(/9874563215/)
        #   expect(rendered).to match(/Surat/)
        #   expect(rendered).to match(/Gujarat/)
        #   expect(rendered).to match(/IN/)

        #   expect(rendered).to match(/John/)
        #   expect(rendered).to match(/Doe/)
        #   expect(rendered).to match(/joendoe123@example.com/)
        #   expect(rendered).to match(/February 01, 2004/)
        #   expect(rendered).to match(/5263987412/)
        #   expect(rendered).to match(/Ahmedabad/)
        #   expect(rendered).to match(/Gujarat/)
        #   expect(rendered).to match(/IN/)
        # end

        it "displays all students" do
          student3 =  FactoryBot.create(:student)
         
           assign(:students, [student3])
           render template: "students/index"
           
 
             expect(rendered).to match /#{student3.first_name}/
         end

        #  View specs can explicitly render templates
        it "displays the student" do
      
          render :template => "students/index"

          expect(rendered).to match /Slicer/
        end

        # View specs can render templates in layouts
        context "rendering the student template" do
          it "displays the student" do

            render :template => "students/index", :layout => "students/index"

            expect(rendered).to match /John/
          end
        end

        # View specs can have description that includes the format and handler
        it "renders a list of students in HTML format" do
          render

          render template: "students/index"

          expect(rendered).to have_selector('h1', text: 'Listing All Students')
          expect(rendered).to match /Slicer/
          expect(rendered).to match /John/
        end

        # View specs can have before block and nesting
        context "with 2 students" do
          it "displays both students" do
            render
      
            expect(rendered).to match /Slicer/
            expect(rendered).to match /John/
          end
        end

        # View specs can render locals in a partial
        it "renders the student partial with the provided locals" do
      
          student = FactoryBot.create(:student)
        
          render partial: "students/student", locals: { student: student }

        
            expect(rendered).to match /#{student.first_name}/
            expect(rendered).to match /#{student.email}/
            expect(rendered).to match /#{student.city}/
            expect(rendered).to match /#{student.state}/
            expect(rendered).to match /#{student.country}/
        end

        #View specs can render text
        it "displays the given text" do

          render :plain => "This is directly rendered"

          expect(rendered).to match /directly rendered/
        end

       # --------------------------------------------------------------View specs use symbols for keys in request.path_parameters to match Rails style---------------------------------
          describe "GET #show" do
          it "matches the Rails environment by using symbols for keys" do
            [:controller, :action].each do |k|
              expect(controller.request.path_parameters.keys).to include(k)
            end
          end

          # ----------------------------------------------------------View spec actions that do not require extra parameters have request.fullpath set------------------------------------

          describe "GET #show" do
              it "has a request.fullpath that is defined" do
                expect(controller.request.fullpath).to eq students_path # Use student_path(student) for the correct path
              end
           end
        


          describe "students/show" do
              it "displays the student with id: 1" do
                  student = Student.create!(:first_name => "jiya", :email => "jiya@example.com", :password => 123456)
                  assign(:student, student)
        
                  render template: "students/show"
                  # expect(controller.request.fullpath).to eq student_path(student)
                  expect(rendered).to have_link('Back', href: students_path)
              end
          end


end


      
end 
