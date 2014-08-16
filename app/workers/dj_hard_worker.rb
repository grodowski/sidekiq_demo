DjHardWorker = Struct.new(:number) do 
  def perform 
    sleep 3
    MY_LOGGER.info "DJ #{number} Finished at #{DateTime.now}"
  end
end