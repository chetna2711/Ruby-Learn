class WelcomeEmailWorker
  include Sidekiq::Worker

  def perform(student_id)
    student = Student.find(student_id)
    StudentMailer.welcome_email(student).deliver_now
  end
end