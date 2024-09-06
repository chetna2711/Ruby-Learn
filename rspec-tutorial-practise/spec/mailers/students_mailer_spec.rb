  require 'rails_helper'

  RSpec.describe StudentMailer, type: :mailer do
    describe 'welcome email' do
      let(:student) { create(:student, email: 'test@example.com') }
      let(:mail) { described_class.welcome_email(student).deliver_now }

      it 'render the subject' do
        expect(mail.subject).to eq('Hello ! Welcome to Our Platform...')  
      end
    end
  end