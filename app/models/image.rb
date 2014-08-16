class Image < ActiveRecord::Base
  class << self 
    def sleep_demo 
      200.times do |n|
         Delayed::Job.enqueue DjHardWorker.new(n)
         SidekiqHardWorker.perform_async(n)
       end
    end
    
    def fetch_demo 
      100.times do |n|
        Delayed::Job.enqueue DjCreateImageWorker.new(n)
        SidekiqCreateImageWorker.perform_async(n)
      end
    end
  end  
end
