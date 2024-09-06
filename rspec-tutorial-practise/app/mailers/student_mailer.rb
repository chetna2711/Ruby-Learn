class StudentMailer < ApplicationMailer
  default from: 'chetnakanak2001@gmail.com'

  def welcome_email(student)
    @student = student
    mail(to: @student.email, subject: 'Hello ! Welcome to Our Platform...')
  end
end
