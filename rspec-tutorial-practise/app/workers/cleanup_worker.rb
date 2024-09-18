class CleanupWorker
  include Sidekiq::Worker

  def perform
    Student.where('created_at < ?', 1.day.ago).delete_all
    puts "Old records cleaned up"
  end
end