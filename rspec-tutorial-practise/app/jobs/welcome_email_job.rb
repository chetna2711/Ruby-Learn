class WelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(student_id)
    student = Student.find_by(id: student_id)
    if student
      StudentMailer.welcome_email(student).deliver_now
    else
      Rails.logger.warn "Student with ID #{student_id} not found."
    end
  end
end
