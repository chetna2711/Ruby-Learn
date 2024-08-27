# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do

  describe '#full_name' do
  context 'when first name and last name are present' do
    it 'returns the full name' do
      @student = Student.new(first_name: 'John', last_name: 'Doe')
      expect(@student.full_name).to eq('John Doe')
    end
  end
end

  
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

  context 'when deleting a student' do
     let(:student) { create :student }

     let(:front_end_skill1) { create :front_end_skill}
     let(:front_end_skill2) {create :front_end_skill , name: 'CSS3'}
     let(:front_end_skill3){create :front_end_skill , name: 'Bootstrap'}

     let(:back_end_skill1){create :back_end_skill}
     let(:back_end_skill2){create :back_end_skill, name: 'Rails'}
     let(:back_end_skill3){create :back_end_skill, name: 'PostgreSQL'}

      let!(:student_skill1) {create :student_skill, student: student, skill:  front_end_skill1, rating: 7} 
      let!(:student_skill2) {create :student_skill , student: student, skill: front_end_skill2, rating: 8}
      let!(:student_skill3) {create :student_skill , student: student, skill: front_end_skill3, rating: 9}

      let!(:student_skill4) {create :student_skill , student: student, skill: back_end_skill1,  rating: 7}
      let!(:student_skill5) {create :student_skill , student: student, skill: back_end_skill2,  rating: 5}
      let!(:student_skill6) {create :student_skill , student: student, skill: back_end_skill3, rating: 6}

      it 'should destroy all student skills' do
        
        expect(student.skills.count).to eq(6)  
        student.destroy
        expect(student.skills.count).to eq(0)
      end


  end
end