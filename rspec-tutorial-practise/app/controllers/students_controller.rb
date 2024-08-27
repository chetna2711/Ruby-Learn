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
      flash[:notice] = 'Student was successfully created.'
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @student.update(student_params)
      flash[:notice] = 'Student was successfully updated.'
      redirect_to students_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:notice] = "Student '#{ @student.full_name }' was successfully deleted."
      redirect_to students_path
    else
      flash[:alert] = 'There was an error deleting the student.'
      redirect_to students_path
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation,:birthdate, :contact_no, :city, :state, :country)
  end
end
