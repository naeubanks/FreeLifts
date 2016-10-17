//
//  ExerciseTableCellView.swift
//  FreeLifts
//
//  Created by Nick Eubanks on 10/15/16.
//  Copyright © 2016 Nick Eubanks. All rights reserved.
//

import UIKit

class ExerciseTableCellView: UITableViewCell {
    @IBOutlet weak var roundedSubView: UIView!
    @IBOutlet weak var repButton1: UIButton!
    @IBOutlet weak var repButton2: UIButton!
    @IBOutlet weak var repButton3: UIButton!
    @IBOutlet weak var repButton4: UIButton!
    @IBOutlet weak var repButton5: UIButton!
    
    var targetReps = 5; // TODO: Based on data model
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundedSubView.layer.masksToBounds = true
        roundedSubView.layer.cornerRadius = 10.0
    }
    
    @IBAction func repButtonTouchUp(_ sender: UIButton) {
        let text = sender.currentTitle
        if text == nil || text!.isEmpty {
            // Initial or reset state, set to target rep count
            sender.setTitle(String(targetReps), for: UIControlState.normal)
            sender.backgroundColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1) // TODO: Color from a constant
        } else if text == "0" {
            // Final state, reset back to initial
            sender.setTitle(String(), for: UIControlState.normal)
            sender.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // TODO: Color from constant
        } else {
            // Decrement reps
            let repCount = Int(text!)
            sender.setTitle(String(repCount! - 1), for: UIControlState.normal)
        }
    }
}

