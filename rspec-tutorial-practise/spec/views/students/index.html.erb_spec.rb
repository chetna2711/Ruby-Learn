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

        it "displays all the students" do
          render

          expect(rendered).to match(/Slicer/)
          expect(rendered).to match(/Dicer/)
          expect(rendered).to match(/slicer123@gmail.com/)
          expect(rendered).to match(/May 02, 2005/)
          expect(rendered).to match(/9874563215/)
          expect(rendered).to match(/Surat/)
          expect(rendered).to match(/Gujarat/)
          expect(rendered).to match(/IN/)

          expect(rendered).to match(/John/)
          expect(rendered).to match(/Doe/)
          expect(rendered).to match(/joendoe123@example.com/)
          expect(rendered).to match(/February 01, 2004/)
          expect(rendered).to match(/5263987412/)
          expect(rendered).to match(/Ahmedabad/)
          expect(rendered).to match(/Gujarat/)
          expect(rendered).to match(/IN/)
        end


        it "displays the student" do
      
          render :template => "students/index"

          expect(rendered).to match /Slicer/
        end

        context "rendering the student template with the inventory layout" do
          it "displays the student" do

            render :template => "students/index", :layout => "students/index"

            expect(rendered).to match /John/
          end
        end

        it "renders a list of students in HTML format" do
          render

          expect(rendered).to have_selector('h1', text: 'Students')
          expect(rendered).to match /Slicer/
          expect(rendered).to match /John/
        end

      #   it "displays all students" do
      #  student3 = Student.create!(
      #       first_name: "kisu",
      #       last_name: "kanak",
      #       email: "kisu@example.com",
      #       password: "password123",
      #       birthdate: "2004-02-01",
      #       contact_no: "9856412589",
      #       city: "Ahmedabad",
      #       state: "Gujarat",
      #       country: "IN"
      #     )
        
      #  render "students/index", :student => student3

      #       expect(rendered).to match /kisu/
      #   end
end
