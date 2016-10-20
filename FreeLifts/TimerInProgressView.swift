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
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var secondTimer : Timer?
    
    // TODO: Animations on show and hide
    
    let successMessage = "Congrats getting 5 reps! If it was easy, rest 90 sec. If not, 3 min."
    
    let failureMessage = "Failing is part of the game! Rest 5 mins and you'll get your nex set!"
    
    func showAndStartTimer(success: Bool) {
        messageTextView.text = success ? successMessage : failureMessage
        
        secondTimer?.invalidate()
        
        if (appDelegate.dataController.restTimerStart == nil) {
            appDelegate.dataController.restTimerStart = Date()
        }
        
        updateTimer()
        
        secondTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        show()
    }
    
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
    
    @IBAction func onHide(_ sender: UIButton) {
        hide()
        stopTimer()
    }
    
    func stopTimer() {
        secondTimer?.invalidate()
        appDelegate.dataController.restTimerStart = nil
    }
    
    func updateTimer() {
        if (appDelegate.dataController.restTimerStart == nil) {
            timerLabel.text = "0 00"
            return
        }
        
        let timeElapsed = -(appDelegate.dataController.restTimerStart!.timeIntervalSinceNow)
        if timeElapsed == 600 { // Stop timer at 10 minutes
            stopTimer()
        }
        
        let minutes = Int(timeElapsed / 60)
        let remainder = Int(timeElapsed) % 60
        var timerString = "\(minutes) "
        if (remainder < 10) {
            timerString += "0"
        }
        timerString += "\(remainder)"
        
        timerLabel.text = timerString
    }

}

