//
//  FirstViewController.swift
//  Trip_Assistant_V01
//
//  Created by ios e on 4/2/18.
//  Copyright © 2018 ios-e. All rights reserved.
//

/* ISSUES:
 - can click cell and segue perfoms while on the menu
 - cannot go back unless clicking the '3 bars'

*/

import UIKit

var activeTrip = Trip.init(tripCode: 0, title: "0", location: "0", Itinerary: [], attendance: false, startDate: "MM/dd/yyyy", endDate: "MM/dd/yyyy" )
var list : [Trip] = []

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var listTableView: UITableView!
    
    
    var mySender = Trip.init(tripCode: 0, title: "0", location: "0", Itinerary: [], attendance: true, startDate: "MM/dd/yyyy", endDate: "MM/dd/yyyy" )
    
    let a = Trip.init(tripCode: 1234, title: "New York", location: "newyork", Itinerary: [], attendance: true, startDate: "MM/dd/yyyy", endDate: "MM/dd/yyyy" )
    let b = Trip.init(tripCode: 5678, title: "Chicago", location: "chicago", Itinerary: [], attendance: true, startDate: "MM/dd/yyyy", endDate: "MM/dd/yyyy" )
    
    //list.append(a)
    //list.append(b)
    
    override func viewDidLoad() {
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        super.viewDidLoad()
        sideMenus()

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sideMenus(){
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
        }
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.tripLabel.text = list[indexPath.row].title
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 4
        
        cell.tripImage.layer.cornerRadius = cell.tripImage.frame.size.width / 2
        cell.tripImage.clipsToBounds = true
        cell.tripImage.image = UIImage(named: list[indexPath.row].location)
        
        return cell
    }
    
    @IBAction func unwindtoTripList(sender: UIStoryboardSegue){
        if let sourceViewControler = sender.source as? NewTripViewController, let trip = sourceViewControler.newTrip {
            let newIndexPath = IndexPath(row: list.count, section: 0)
            list.append(trip)
            listTableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    /* Did select: https://stackoverflow.com/questions/22759167/how-to-make-a-push-segue-when-a-uitableviewcell-is-selected?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa
 */
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mySender = list[indexPath.row]
        self.performSegue(withIdentifier: "listItinerary", sender: self)
     }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // let activityViewController = segue.destination as! activityViewController
        activeTrip = mySender //?? Trip.init
     
     }
 
 
    
}
