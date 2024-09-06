class StudentService
  def self.call(student)
    return unless student.persisted?
    StudentMailer.welcome_email(student).deliver_now
  end
end
