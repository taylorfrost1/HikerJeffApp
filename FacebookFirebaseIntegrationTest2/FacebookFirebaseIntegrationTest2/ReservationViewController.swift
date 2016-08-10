//
//  ReservationViewController.swift
//  FacebookFirebaseIntegrationTest2
//
//  Created by Taylor Frost on 8/6/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ReservationViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var ref: FIRDatabaseReference!
    var refHandle: UInt!
    var dateList = [Date]()
    var takenDates = [Date]()
    let cellId = "cellId"
    
    @IBOutlet weak var reservationTableView: UITableView!
    
    var dateArray = ["August 13, 2016", "August 20, 2016", "August 27, 2016", "September 3, 2016", "September 10, 2016","September 17, 2016", "September 24, 2016", "October 1, 2016", "October 8, 2016", "October 15, 2016", "October 22, 2016", "October 29, 2016", "November 5, 2016", "November 12, 2016", "November 19, 2016", "November 26, 2016", "December 3, 2016", "December 10, 2016", "December 17, 2016", "December 24, 2016"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
        fetchDates()
        seedDates()
    }
    
    func seedDates() {
        
        for date in dateArray.reverse(){
            
            ref.child("Dates").child(date ).updateChildValues([
                "taken":false,
                "hasmcdoubled": 1
                
                ])
        }
    }
    
    func fetchDates(){
        
        refHandle = ref.child("Dates").observeEventType(.Value, withBlock: {(snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject]{
                
                self.dateList = []
                
                for item in dictionary {
                    
                    let dateString = item.0
                    
                    if let dateInfo = item.1 as? [String:AnyObject] {
                    
                        
                        if let taken = dateInfo["taken"] as? Bool {
                            
                            let date = Date()
                            date.date = dateString
                            date.ref = self.ref.child("Dates").child(dateString)
                            
                            date.taken = taken
                            
                            if taken == false {
                                
                                self.dateList.append(date)
                                
                                
                            } else {
                                
                                self.takenDates.append(date)
                                
                            }
                            
                        }
                        
                    }
                    
                    
                }
                
                self.reservationTableView?.reloadData()
                
            }
            
        })
        
    }
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dateList.count
    }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ReservationTableViewCell
        
        cell.dateLabel?.text = dateList[indexPath.row].date
        
        cell.dateLabel?.layer.cornerRadius = 10
        
        cell.dateLabel?.clipsToBounds = true
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("questionsControllerSegue", sender: self)
     
    }
    
  

}
