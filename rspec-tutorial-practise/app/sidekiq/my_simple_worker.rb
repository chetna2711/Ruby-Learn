class MySimpleWorker
  include Sidekiq::Worker

  def perform(text)
    puts 'hiiii ' + text
  end
end