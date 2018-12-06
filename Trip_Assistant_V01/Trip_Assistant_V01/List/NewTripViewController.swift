//
//  NewTripViewController.swift
//  Trip_Assistant_V01
//
//  Created by ios e on 10/4/18.
//  Copyright © 2018 ios-e. All rights reserved.
//

import UIKit
import os.log

class NewTripViewController: UIViewController {
    
    @IBOutlet weak var inputStart: UITextField!
    @IBOutlet weak var inputEnd: UITextField!
    @IBOutlet weak var inputTitle: UITextField!
    @IBOutlet weak var inputLocation: UITextField!
    
    @IBOutlet weak var newTripButton: UIButton!
    
    var newTrip:Trip?
    
    
    private var startDatePicker: UIDatePicker?
    private var endDatePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readFromFile()
        // Do any additional setup after loading the view.
        
        startDatePicker = UIDatePicker()
        startDatePicker?.datePickerMode = .date
        startDatePicker?.addTarget(self, action: #selector(NewTripViewController.startDateChanged(datePicker:)), for: .valueChanged)
        
        endDatePicker = UIDatePicker()
        endDatePicker?.datePickerMode = .date
        endDatePicker?.addTarget(self, action: #selector(NewTripViewController.endDateChanged(datePicker:)), for: .valueChanged)
        
        //Date gesture
        //self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector(UIDatePicker.endEditing(true))))
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewTripViewController.dismissKeyboard(_:)) )
        view.addGestureRecognizer(gesture)
        
        //Textfield gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        inputStart.inputView = startDatePicker
        inputEnd.inputView = endDatePicker
        
        print("*************************************************")
        let file = "myfile.txt" //this is the file. we will write to and read from it
        
        let text = "some text" //just a text
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            //writing
            do {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
                print("*************************************************write done")
            }
            catch {/* error handling here */}
            
            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                print("***********************",text2)
            }
            catch {/* error handling here */}
        }
        
        
        
        
        
    }
    
    
    @objc func startDateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        inputStart.text = dateFormatter.string(from: datePicker.date)
    }
    @objc func endDateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        inputEnd.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    func readFromFile(){
        print("1")
        let filePath = Bundle.main.url(forResource: "myfile", withExtension: "txt")
        print(filePath)
         if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
        print(documentsDirectory)
        do
        {
            print("2")
            if try (filePath?.checkResourceIsReachable())!
            {
                print("file exist")
                let propertyListDecoder = PropertyListDecoder()
                if let retrievedTripData = try? Data(contentsOf: filePath!),
                    let decodedTrips = try? propertyListDecoder.decode(Trip.self, from:retrievedTripData) {
                    print(decodedTrips)
                    
                }
                print("done")
            }
            else
            {
                print("file doesnt exist")
            }
        }
        catch
        {
            print("an error happened while checking for the file")
            print("##############Directory", documentsDirectory)
            // print("filePath" , filePath)
        }
    }
}
    
    func writeToFile(myTrip: Trip) {
        
       /* if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            let propertyListEncoder = PropertyListEncoder()
            let encodedTrips = try? propertyListEncoder.encode(newTrip)
            try? encodedTrips?.write(to: filePath!,options: .noFileProtection)
            let propertyListDecoder = PropertyListDecoder()
            if let retrievedTripData = try? Data(contentsOf: filePath!),
                let decodedTrips = try? propertyListDecoder.decode(Trip.self, from:retrievedTripData) {
                print(decodedTrips)
            }
        }*/
        print("1")
        let filePath = Bundle.main.url(forResource: "myfile", withExtension: "txt")
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
            do
            {
               print("2")
                if try (filePath?.checkResourceIsReachable())!
                {
                    let str = "suhsuhhs"
                    try str.write(to: filePath!, atomically: true, encoding: String.Encoding.utf8)
                    let text2 = try String(contentsOf: (filePath ?? nil)!, encoding: .utf8)
                    print(text2)
                    print("file exist")
                        let propertyListEncoder = PropertyListEncoder()
                        let encodedTrips = try? propertyListEncoder.encode(myTrip)
                        try? encodedTrips?.write(to: filePath!,options: .noFileProtection)
                    print("done")
                }
                else
                {
                    print("file doesnt exist")
                }
            }
            catch
            {
                print("an error happened while checking for the file")
                print("##############Directory", documentsDirectory!)
                // print("filePath" , filePath)
            }
        }
    
    
    
     @IBAction func buttonPressed(_ sender: Any) {
     
    
        //writeToFile(myTrip: newTrip)
        //readFromFile()
        performSegue(withIdentifier: "new_trip", sender: nil)
        
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIButton, button === newTripButton else {
            os_log("Button not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
         newTrip = Trip(tripCode: 0000, title: inputTitle.text ?? "" , location: inputLocation.text ?? "", Itinerary: [], attendance: false, startDate: inputStart.text!, endDate: inputEnd.text!)
        
        /*
        if segue.identifier == "new_first" {
            let listViewController = segue.destination as! ListViewController
            listViewController.mySender = newTrip
        }*/
    }
    
    
}


