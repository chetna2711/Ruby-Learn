
require 'rails_helper'

RSpec.describe "students/show.html.erb", type: :view do
  it "displays the formatted birth date" do
    student = FactoryBot.create(:student, birthdate: Date.new(2024, 9, 3))

    # Stub the helper method
    allow(view).to receive(:format_date).with(student.birthdate).and_return("September 03, 2024")

    # Render the view
    assign(:student, student)
    render 
    
    
    # Check the output
    expect(rendered).to match /September 03, 2024/
  end
end
