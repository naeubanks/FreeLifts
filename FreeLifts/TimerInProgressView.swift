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
    
    let successMessage = "Congrats getting 5 reps! If it was easy, rest 90 sec. If not, 3 min."
    
    let failureMessage = "Failing is part of the game! Rest 5 mins and you'll get your nex set!"
    
    func showAndStartTimer(success: Bool) {
        messageTextView.text = success ? successMessage : failureMessage
        
        // TODO: Start timer
        timerLabel.text = "0 00"
        
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
    
    @IBAction func onHide(_ sender: UIButton) {
        hide()
    }

}

