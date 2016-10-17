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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundedSubView.layer.masksToBounds = true
        roundedSubView.layer.cornerRadius = 10.0
    }
}

