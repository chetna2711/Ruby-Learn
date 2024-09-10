namespace :students do
  desc 'Send days summary of new student registrations'
  task day_summary: :environment do
    cuttof_time = 1.days.ago
    new_students = Student.where('created_at >=?', cuttof_time)

    if new_students.exists?

      new_students.each do |student|
        AdminMailer.day_summary(student).deliver_now
        puts "day summary email sent to #{student.email}"
      end
    else
      puts 'No new student registered at today'
    end
  end
end
