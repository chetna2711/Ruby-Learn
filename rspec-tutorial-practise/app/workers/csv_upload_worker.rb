class CsvUploadWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'csv_upload'

  require 'csv'

  def perform(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      student_attributes = row.to_hash
      Student.create!(student_attributes)
    end
  end
end
