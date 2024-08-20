# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'when creating a student' do
    let(:student) { build(:student) }
    let(:student1) { create(:student, state: nil) }
    let(:student2) { build(:student, email: student.email, contact_no: student.contact_no) }

    it 'is valid with all attributes' do
      expect(student).to be_valid
    end

    it 'sets state to country if state is nil' do
      student1.save
      expect(student1.state).to eq(student1.country)
    end

    it 'raises a validation error for duplicate email and contact' do
      student.save
      expect(student2.save).to eq(false)
    end
  end
end
