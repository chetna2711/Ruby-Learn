class AdminMailer < ApplicationMailer
  default from: 'chetnakanak2001@gmail.com'

  def day_summary(student)
    @student = student
    mail(to: @student.email, subject: 'Welcomt to our platform! I hope you enjoy our services')
  end
end
