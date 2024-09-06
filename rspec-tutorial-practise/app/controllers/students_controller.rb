class StudentsController < ApplicationController
  # class StudentsController < Devise::RegistrationsController
  before_action :set_student, only: %i[show edit update destroy]
  before_action :prepare_devise_view, only: %i[new create edit update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  # def create
  #   @student = Student.new(student_params)
  #   if @student.save
  #     flash[:notice] = 'Student was successfully created.'
  #     # redirect_to students_path
  #     # Redirects to the show page of the newly created student

  #     redirect_to @student
  #     # Render the index template instead of redirecting
  #     # render :index
  #   else
  #     # Renders new form if create fails
  #     render 'devise/registrations/new', status: :unprocessable_entity
  #   end
  # end

  def show; end

  def edit; end

  def update
    if @student.update(student_update_params)
      flash[:notice] = 'Student was successfully updated.'
      # redirect the index page
      redirect_to students_path
      # redirect_to @student
    else
      # Renders edit form if update rails
      render 'devise/registrations/edit', status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:notice] = "Student '#{@student.full_name}' was successfully deleted."
      redirect_to students_path
    else
      flash[:alert] = 'There was an error deleting the student.'
      redirect_to students_path
    end
  end

  private

  def prepare_devise_view
    @resource = @student || Student.new
    @resource_name = :student
    # @devise_mapping = Devise.mappings[:student]
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation, :birthdate,
                                    :contact_no, :city, :state, :country)
  end

  def student_update_params
    params.require(:student).permit(:first_name, :last_name, :birthdate, :contact_no, :city, :state, :country)
  end
end
