class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to students_path, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @student.destroy
      redirect_to students_path, notice: 'Student was successfully deleted.'
    else
      redirect_to students_path, alert: 'Failed to delete student.'
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to students_path, alert: 'Student not found.'
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :birthdate, :contact_no, :city, :state, :country)
  end
end
