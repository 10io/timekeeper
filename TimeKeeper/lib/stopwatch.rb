#
#  stopwatch.rb
#  TimeKeeper
#
#  Created by David Fernandez on 05/05/2013.
#  Copyright 2013 David Fernandez. All rights reserved.
#
class Stopwatch
    def initialize(duration=60 * 60 * 8 + 24 * 60)
        @duration = duration
        @state = :not_running
    end
    
    def start
        @start = Time.now.to_i
        @state = :running
    end
    
    def pause
        @stop = Time.now.to_i
        @state = :paused
    end
    
    def unpause
        @stop = nil
        @state = :running
    end
    
    def remaining
        return "00:00:00" if !counting?
        
        seconds = @duration - Time.now.to_i + @start
        
        seconds = @duration - @stop + @start if paused?
        
        Time.at(seconds).utc.strftime("%H:%M:%S")
    end
    
    def counting?
        @state == :running or @state == :paused
    end
    
    def running?
        @state == :running
    end
    
    def paused?
        @state == :paused
    end
end

