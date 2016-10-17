//
//  WorkoutTableCellView.swift
//  FreeLifts
//
//  Created by Nick Eubanks on 10/15/16.
//  Copyright © 2016 Nick Eubanks. All rights reserved.
//

import UIKit

class WorkoutTableCellView: UITableViewCell {
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelWorkoutOne: UILabel!
    @IBOutlet weak var labelWorkoutTwo: UILabel!
    @IBOutlet weak var labelWorkoutThree: UILabel!
    @IBOutlet weak var labelStatusOne: UILabel!
    @IBOutlet weak var labelStatusTwo: UILabel!
    @IBOutlet weak var labelStatusThree: UILabel!
    @IBOutlet weak var roundedSubView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundedSubView.layer.masksToBounds = true
        roundedSubView.layer.cornerRadius = 10.0
    }
}

