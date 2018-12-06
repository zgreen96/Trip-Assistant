//
//  SetItineraryViewController.swift
//  Trip_Assistant_V01
//
//  Created by ios e on 10/18/18.
//  Copyright © 2018 ios-e. All rights reserved.
//

import UIKit
import os.log

class AddActivityViewController: UIViewController {
   
    var activity: Activity?

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var endTime: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var myDescripton: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("Save button not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        activity = Activity(dates: date.text ?? "" , title: name.text ?? "", description: myDescripton.text ?? "", location: location.text ?? "", startTime: startTime.text ?? "", endTime: endTime.text ?? "")
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
