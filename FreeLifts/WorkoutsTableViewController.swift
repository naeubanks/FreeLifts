//
//  WorkoutsTableViewController.swift
//  FreeLifts
//
//  Created by Nick Eubanks on 10/15/16.
//  Copyright © 2016 Nick Eubanks. All rights reserved.
//

import UIKit
import Foundation

class WorkoutsTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.s
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let workouts = appDelegate.getActiveParticipant().workouts
        if (workouts == nil) {
            // One row for starting a new workout
            return 1;
        }
        
        // Only show the three most recent workouts here plus the current one (or a row to start a new one)
        return (workouts!.count > 3 ? 3 : 0) + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let participant = appDelegate.getActiveParticipant()
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutTableCell", for: indexPath)
        let workoutCell = cell as! WorkoutTableCellView
    
        if (indexPath.row == 0) {
            workoutCell.labelDate?.text = (participant.currentWorkout == nil) ? "Next" : "Ongoing"
        } else {
            let workout = participant.workouts?.allObjects[participant.workouts!.count - indexPath.row - 1] as! Workout
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, MMM dd"
            workoutCell.labelDate?.text = dateFormatter.string(from: workout.date as! Date)
        }
        
        return cell
    }
    
}


