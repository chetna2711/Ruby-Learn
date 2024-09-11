class WelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(student_id)
    student = Student.find(student_id)
    StudentMailer.welcome_email(student).deliver_now
  end
end
