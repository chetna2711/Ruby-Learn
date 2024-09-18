# require 'csv'

# class CsvImportWorker
#   include Sidekiq::Worker

#   def perform(file_path)
#     CSV.foreach(file_path, headers: true) do |row|
#       student_data = row.to_hash
#       Srtudent.create(first_name: student_data['first_name'], email: student_data['email'])
#     end
#   end
# end
