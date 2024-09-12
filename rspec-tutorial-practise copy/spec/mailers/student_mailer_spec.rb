require 'rails_helper'

RSpec.describe StudentMailer, type: :mailer do
  describe '#welcome_email' do
    let(:student) { create(:student) }
    let(:mail) { StudentMailer.welcome_email(student) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Hello ! Welcome to Our Platform...')
      expect(mail.to).to eq([student.email])
      expect(mail.from).to eq(['chetnakanak2001@gmail.com'])  
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match( `Hello ! Welcome to Our Platform...
                                          Thank you for registering. You can log in here `)
      expect(mail.body.encoded).to match(student.first_name)
    end

    it 'should have access to URL helpers with default options' do
    expect { students_url }.not_to raise_error
  end

  it 'should have access to URL helpers without default options' do
    expect { students_url :host => 'http://127.0.0.1:3000/' }.not_to raise_error
    expect(students_url).to eq('http://127.0.0.1/main/students')
  end
  end
end
