require 'rails_helper'

RSpec.describe StudentsHelper, type: :helper do
  describe '#format_date' do
  it 'formats the date as "Day Month, Year"' do
    date = Date.new(2024, 9, 6)
    formatted_date = helper.format_date(date)
    expect(formatted_date).to eq('September 06, 2024')
  end

  it 'returns an empty string for nil' do
    formatted_date = helper.format_date(nil)
    expect(formatted_date).to eq('')
  end
end

  describe '#formatted_student_name' do
    let(:student) { Student.new(first_name: 'john', last_name: 'doe') }

    it 'returns the full name with titleized format' do
      expect(helper.formatted_student_name(student)).to eq('John Doe')
    end

    it 'returns an empty string when student is nil' do
      expect(helper.formatted_student_name(nil)).to eq('')
    end
  end


  describe '#formatted_address' do
  let(:student) { Student.new(city: 'New York', state: 'NY', country: 'USA') }

  it 'returns a formatted address string' do
    expect(helper.formatted_address(student)).to eq('New York, NY, USA')
  end

  it 'handles missing city' do
    student.city = nil
    expect(helper.formatted_address(student)).to eq(', NY, USA')
  end

  it 'handles missing state' do
    student.state = nil
    expect(helper.formatted_address(student)).to eq('New York, , USA')
  end

  it 'handles missing country' do
    student.country = nil
    expect(helper.formatted_address(student)).to eq('New York, NY, ')
  end

  it 'returns an empty string when student is nil' do
    expect(helper.formatted_address(nil)).to eq('')
  end
end
end
