//
//  activityViewController.swift
//  Trip_Assistant_V01
//
//  Created by ios e on 4/30/18.
//  Copyright © 2018 ios-e. All rights reserved.
//

import UIKit


var listActivity: [Activity] = []
class ItineraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var attendanceLabel: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var itineraryTableView: UITableView!
    
    
    
    var receivedData = Trip.init(tripCode: 0, title: "0", location: "0", Itinerary: [], attendance: false, startDate: "MM/dd/yyyy", endDate: "MM/dd/yyyy" )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itineraryTableView.delegate = self
        itineraryTableView.dataSource = self
        
        sideMenus()
        
        if (activeTrip.title == "0"){
            self.title = ""
        }
        else {
            self.title = activeTrip.title
        }
//        titleLabel.text = receivedData.title
//        codeLabel.text = String(receivedData.tripCode)
//        locationLabel.text = receivedData.location
//        attendanceLabel.text = String(receivedData.attendance)
        
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listActivity.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.tripLabel.text = listActivity[indexPath.row].title
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 4
        
        /*cell.tripImage.layer.cornerRadius = cell.tripImage.frame.size.width / 2
        cell.tripImage.clipsToBounds = true
        cell.tripImage.image = UIImage(named: list[indexPath.row].location)
        */
        return cell
    }
    
    func sideMenus(){
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindtoItinerary(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? AddActivityViewController, let activity = sourceViewController.activity{
            let newIndexPath = IndexPath(row: listActivity.count, section: 0 )
            listActivity.append(activity)
            itineraryTableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
