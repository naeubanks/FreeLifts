//
//  ExercisesViewController.swift
//  FreeLifts
//
//  Created by Nick Eubanks on 10/15/16.
//  Copyright © 2016 Nick Eubanks. All rights reserved.
//

import UIKit

// Make it so that borderColor can be set as a User Defined Runtime Attribute
extension UIButton{
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
            layer.borderWidth = 1
        }
    }
}

class ExercisesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var exerciseTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exerciseTable.delegate = self
        exerciseTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath)
        // TODO: Configure based on data model
        return cell
    }

}

