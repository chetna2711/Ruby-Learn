require 'rails_helper'


RSpec.describe StudentsController  do
  describe 'GET index' do
    let(:student) {create :student }
    it 'assigns @students' do
      sign_in(student)
      get :index
      expect(assigns(:students)).to eq([student])
    end
  end
end