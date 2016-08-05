//
//  ViewController.swift
//  ReservationFirebaseTest2
//
//  Created by Taylor Frost on 8/4/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class DateTableViewController: UITableViewController {
    
    var ref: FIRDatabaseReference!
    var refHandle: UInt!
    var dateList = [Date]()
    let cellId = "cellId"
    
    var dateArray = ["August 3, 2016", "August 10, 2016", "August 17, 2016", "August 24, 2016"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
        FIRAuth.auth()?.signInAnonymouslyWithCompletion() { (user, error) in
            
            //            self.seedDates()
            
            print(user!.uid)
            
        }
        
        fetchDates()
        
        
        
        
    }
    
    func seedDates() {
        
        for date in dateArray{
            
            ref.child("Dates").child(date).updateChildValues([
                "taken":false,
                "hasmcdoubled": 1
                
                ])
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dateList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        
        cell.textLabel?.text = dateList[indexPath.row].date
        
        return cell
        
    }
    
    
    func fetchDates(){
        
        refHandle = ref.child("Dates").observeEventType(.Value, withBlock: {(snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject]{
                
                self.dateList = []
                
                for item in dictionary {
                    
                    let dateString = item.0
                        
                        if let dateInfo = item.1 as? [String:AnyObject] {
                            
                           
                            if let taken = dateInfo["taken"] as? Bool {
                                
                                if taken == false {
                                    
                                    let date = Date()
                                    date.date = dateString
                                    date.ref = self.ref.child("Dates").child(dateString)
                                    
                                      date.taken = taken
                                    
                                    
                                    self.dateList.append(date)

                                    
                                }
                                
                              
                                
                            }

                            
                            
                        
                    }
                    
                   
                }
                
                self.tableView.reloadData()
                
            }
            
        })
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let date = dateList[indexPath.row]
        
        let bool = !date.taken!
        
        date.ref?.updateChildValues([
            
            "taken":bool
            
            ])
        
    }
    
    

    
    
    
}

