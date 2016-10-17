//
//  ExerciseConfigurationViewController.swift
//  FreeLifts
//
//  Created by Nick Eubanks on 10/16/16.
//  Copyright © 2016 Nick Eubanks. All rights reserved.
//

import UIKit

class ExerciseConfigurationViewController: UIViewController {
    
    @IBOutlet weak var button5x5: UIButton!
    @IBOutlet weak var button3x5: UIButton!
    @IBOutlet weak var button3x3: UIButton!
    @IBOutlet weak var button1x3: UIButton!
    @IBOutlet weak var perSideWeightLabel: UINavigationItem!
    @IBOutlet weak var currentWeightLabel: UILabel!
    
    @IBOutlet weak var plateGuide45: UILabel!
    @IBOutlet weak var plateGuide25: UILabel!
    @IBOutlet weak var plateGuide10: UILabel!
    @IBOutlet weak var plateGuide5: UILabel!
    @IBOutlet weak var plateGuide2: UILabel!
    
    let weightIncrement = 5; // TODO: Consider fractional plates
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.s
    }
    
    @IBAction func onCancelButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: {})
    }
    
    @IBAction func onDoneButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: {
            // TODO: Commit the new weight to the data model
        })
    }
    
    func updatePlateDistributionView(perSideWeight: Double) {
        var weightRemaining = perSideWeight;
        var currentPlateCount = 0;
        
        if (weightRemaining >= 45.0) {
            currentPlateCount = Int(weightRemaining / 45);
            plateGuide45.isHidden = false
            plateGuide45.text = "\(currentPlateCount) x 45lb"
            weightRemaining -= (Double(currentPlateCount) * 45.0)
        } else {
            plateGuide45.isHidden = true
        }
        
        if (weightRemaining >= 25.0) {
            currentPlateCount = Int(weightRemaining / 25);
            plateGuide25.text = "\(currentPlateCount) x 25lb"
            plateGuide25.isHidden = false
            weightRemaining -= (Double(currentPlateCount) * 25.0)
        } else {
            plateGuide25.isHidden = true
        }
        
        if (weightRemaining >= 10.0) {
            currentPlateCount = Int(weightRemaining / 10);
            plateGuide10.text = "\(currentPlateCount) x 10lb"
            plateGuide10.isHidden = false
            weightRemaining -= (Double(currentPlateCount) * 10.0)
        } else {
            plateGuide10.isHidden = true
        }
        
        if (weightRemaining >= 5.0) {
            currentPlateCount = Int(weightRemaining / 5);
            plateGuide5.text = "\(currentPlateCount) x 5lb"
            plateGuide5.isHidden = false
            weightRemaining -= (Double(currentPlateCount) * 5.0)
        } else {
            plateGuide5.isHidden = true
        }
        
        if (weightRemaining >= 2.5) {
            currentPlateCount = Int(weightRemaining / 2.5);
            plateGuide2.text = "\(currentPlateCount) x 2.5lb"
            plateGuide2.isHidden = false
            weightRemaining -= (Double(currentPlateCount) * 2.5)
        } else {
            plateGuide2.isHidden = true
        }
    }
    
    func updateWeight(change: Int) {
        let currentWeight = Int(currentWeightLabel.text!)! + change
        currentWeightLabel.text = String(currentWeight)
        
        let perSideWeight = Double(currentWeight - 45) * 0.5
        
        if (floor(perSideWeight) == perSideWeight) {
            // Trim trailing .0
            perSideWeightLabel.title = "Add \(Int(perSideWeight))lb/side"
        } else {
            perSideWeightLabel.title = "Add \(perSideWeight)lb/side"
        }
        
        updatePlateDistributionView(perSideWeight: perSideWeight)
    }
    
    @IBAction func addWeight(_ sender: AnyObject) {
        updateWeight(change: weightIncrement);
    }
    
    @IBAction func removeWeight(_ sender: AnyObject) {
        updateWeight(change: -weightIncrement)
    }
    
    func resetButtons() {
        button5x5.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button3x5.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button3x3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button1x3.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        button5x5.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        button3x5.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        button3x3.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
        button1x3.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: UIControlState.normal)
    }
    
    func setActiveButton(button: UIButton) {
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: UIControlState.normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
    }
    
    @IBAction func setAs5x5(_ sender: UIButton) {
        resetButtons()
        setActiveButton(button: sender)
    }
    
    @IBAction func setAs3x5(_ sender: UIButton) {
        resetButtons()
        setActiveButton(button: sender)
    }
    
    @IBAction func setAs3x3(_ sender: UIButton) {
        resetButtons()
        setActiveButton(button: sender)
    }
    
    @IBAction func setAs1x4(_ sender: UIButton) {
        resetButtons()
        setActiveButton(button: sender)
    }
}


