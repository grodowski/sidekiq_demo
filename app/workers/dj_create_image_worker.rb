require 'open-uri'

DjCreateImageWorker = Struct.new(:number) do 
  DOGE_URL = 'http://img1.wikia.nocookie.net/__cb20140807211510/bayonetta/images/0/05/Doge.png'

  def perform
    open DOGE_URL do |tempfile|
      Image.create content: tempfile.read
    end
    MY_LOGGER.info "DJ #{number} Finished at #{DateTime.now}" 
  end
  
end