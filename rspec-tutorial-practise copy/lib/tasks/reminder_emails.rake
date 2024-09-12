
namespace :students do
  desc "Send reminder emails to inactive students"
  task sned_reminders: :environment do
    cutoff_date = 2.days.ago

    inactive_students = Student.where("updated_at < ?", cutoff_date)
    inactive_students.each do |student|
      StudentMailer.welcome_email(student).deliver_now
      puts "Reminder email sent to #{student.email}"
    end

    puts "Reminder emails sent to #{inactive_students.count} students." 
  end
end
