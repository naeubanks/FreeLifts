//
//  WorkoutsTableViewController.swift
//  FreeLifts
//
//  Created by Nick Eubanks on 10/15/16.
//  Copyright © 2016 Nick Eubanks. All rights reserved.
//

import UIKit

class WorkoutsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.s
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutTableCell", for: indexPath)
        let workoutCell = cell as! WorkoutTableCellView
        workoutCell.labelDate?.text = "TODO"
        return cell
    }
    
}


