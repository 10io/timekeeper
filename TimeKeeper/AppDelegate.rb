#
#  AppDelegate.rb
#  TimeKeeper
#
#  Created by David Fernandez on 04/05/2013.
#  Copyright 2013 David Fernandez. All rights reserved.
#

class AppDelegate
    attr_accessor :window
    attr_accessor :text_field #outlet
    
    def applicationDidFinishLaunching(a_notification)
        # Insert code here to initialize your application
    end
    
    def startTimer(sender)
      if @timer.nil?
            @time = 0.0
            @timer = NSTimer
                      .scheduledTimerWithTimeInterval(0.1,
                                                      target: self,
                                                      selector: "timerHandler:",
                                                      userInfo: nil,
                                                      repeats: true)
      end
    end

    def stopTimer(sender)
      if @timer
        @timer.invalidate
        @timer = nil
      end
    end
    
    def timerHandler(userInfo)
      @time += 0.1
      string = sprintf("%.1f", @time)
      text_field.setStringValue(string)
    end
end