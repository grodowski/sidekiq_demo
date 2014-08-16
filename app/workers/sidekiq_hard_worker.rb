class SidekiqHardWorker
  include Sidekiq::Worker
  
  def perform(number)
    sleep 3
    MY_LOGGER.info "SIDEKIQ #{number} Finished at #{DateTime.now}"
  end
  
end