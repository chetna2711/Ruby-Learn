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
      render :new, status: :unprocessable_entity
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
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @student.destroy
      flash[:errors] = "Student Deleted Successfully"
      redirect_to root_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to destroy_student_path
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :birthdate, :contact_no, :city, :state, :country)
  end
end
