#
#  AppDelegate.rb
#  TimeKeeper
#
#  Created by David Fernandez on 04/05/2013.
#  Copyright 2013 David Fernandez. All rights reserved.
#
class AppDelegate
    #outlets
    attr_accessor :window
    attr_accessor :date_field
    attr_accessor :time_field
    attr_accessor :remaining_time_field 
    
    attr_accessor :start_button
    attr_accessor :pause_button
    attr_accessor :unpause_button
    
    def applicationDidFinishLaunching(a_notification)
      @stopwatch = Stopwatch.new
      repaint(nil)
      NSTimer.scheduledTimerWithTimeInterval(0.5,
      target: self,
      selector: "repaint:",
      userInfo: nil,
      repeats: true)
    end
    
    def start(sender)
      @stopwatch.start
    end
    
    def pause(sender)
      @stopwatch.pause
    end
    
    def unpause(sender)
      @stopwatch.unpause
    end
    
    def repaint(userInfo)
      time = Time.now
      date_field.setStringValue(time.strftime(" %b %d, %Y "))
      time_field.setStringValue(time.strftime("%I:%M.%S"))
      remaining_text = @stopwatch.remaining
      remaining_text += " (Paused)" if @stopwatch.paused?
      remaining_time_field.setStringValue(remaining_text)
      
      hide(start_button)
      hide(pause_button)
      hide(unpause_button)
      
      if !@stopwatch.counting?
        unhide(start_button)
      end
      if @stopwatch.running?
        unhide(pause_button)
      end
      if @stopwatch.paused?
        unhide(unpause_button)
      end
    end
    
    def hide(object)
      object.setTransparent(true)
      object.setEnabled(false)
    end
    
    def unhide(object)
      object.setTransparent(false)
      object.setEnabled(true)
    end
end