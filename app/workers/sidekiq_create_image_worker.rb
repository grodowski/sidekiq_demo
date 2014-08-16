require 'open-uri'

class SidekiqCreateImageWorker 
  include Sidekiq::Worker
  DOGE_URL = 'http://img1.wikia.nocookie.net/__cb20140807211510/bayonetta/images/0/05/Doge.png'
  
  def perform(number)
    open DOGE_URL do |tempfile|
      Image.create content: tempfile.read
    end
    MY_LOGGER.info "SIDEKIQ #{number} Finished at #{DateTime.now}" 
  # rescue SQLite3::BusyException => e
#  MY_LOGGER. "SIDEKIQ #{number} SQLite Exception! #{DateTime.now}" 
  end
  
end