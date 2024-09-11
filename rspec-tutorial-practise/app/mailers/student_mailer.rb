# class StudentMailer < ApplicationMailer
#   default from: 'chetnakanak2001@gmail.com'

#   def welcome_email(student)
#     @student = student
#     mail(to: @student.email, subject: 'Hello ! Welcome to Our Platform...')
#   end
# end


class StudentMailer < ApplicationMailer
  default from: 'chetnakanak2001@gmail.com'

  def welcome_email(student)
    @student = student
    @url  = 'http://localhost:3000/students/sign_in'
    mail(to: @student.email, subject: 'Welcome to My Awesome Site')
  end
end

