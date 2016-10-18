//
//  TimerInProgressView.swift
//  FreeLifts
//
//  Created by Nick Eubanks on 10/17/16.
//  Copyright © 2016 Nick Eubanks. All rights reserved.
//

import UIKit

class TimerInProgressView : UIView {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var messageTextView: UITextView!
    
    // TODO: Animations on show and hide
    
    // TODO: Move the timer to global storage and hook up to applicationWillResignActive/applicationDidBecomeActive
    // Update seconds in applicationDidBecomeActive to determine the correct value on suspend/resume scenarios
    var secondTimer : Timer?
    var seconds = 0
    
    let successMessage = "Congrats getting 5 reps! If it was easy, rest 90 sec. If not, 3 min."
    
    let failureMessage = "Failing is part of the game! Rest 5 mins and you'll get your nex set!"
    
    func showAndStartTimer(success: Bool) {
        messageTextView.text = success ? successMessage : failureMessage
        
        timerLabel.text = "0 00"
        
        secondTimer?.invalidate()
        seconds = 0
        secondTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(addSecond), userInfo: nil, repeats: true)
        
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
    
    @IBAction func onHide(_ sender: UIButton) {
        hide()
    }
    
    func addSecond() {
        seconds += 1
        if seconds == 600 { // Stop timer at 10 minutes
            secondTimer?.invalidate()
            secondTimer = nil
        }
        
        let minutes = Int(seconds / 60)
        let remainder = Int(seconds % 60)
        var timerString = "\(minutes) "
        if (remainder < 10) {
            timerString += "0"
        }
        timerString += "\(remainder)"
        
        timerLabel.text = timerString
    }

}

