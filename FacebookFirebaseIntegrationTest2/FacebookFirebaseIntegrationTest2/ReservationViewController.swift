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
    var dateString = "August 13, 2016"
    let formatter = NSDateFormatter()
    var date = NSDate()
    var currentDate = Date()
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    @IBOutlet weak var reservationTableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
        formatter.dateFormat = "MMMM d, yyyy"
        
        self.date = formatter.dateFromString(dateString)!
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(reloadData), name: "reloadTableviewData", object: nil)
        
        
       
        //        seedDates()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.dateList = appDelegate.dateList
        
    }
    
    func seedDates() {
        
        for _ in 1...52 {
            
            
            ref.child("Dates").child(dateString).updateChildValues([
                
                "taken":false
                
                ])
            
            self.date = date.dateByAddingTimeInterval(604800)
            
            
            self.dateString = formatter.stringFromDate(date)
            
        }
    }
    
    func reloadData() {
        
        self.dateList = appDelegate.dateList
        self.reservationTableView.reloadData()
        
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dateList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ReservationTableViewCell
        
        let dateObject = dateList[indexPath.row]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        if let date = dateObject.date {
            
            let dateString = formatter.stringFromDate(date)
            
            cell.dateLabel?.text = dateString
            
            
        }
        
        
        cell.dateLabel?.layer.cornerRadius = 10
        
        cell.dateLabel?.clipsToBounds = true
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
       
        self.currentDate = dateList[indexPath.row]
     
        performSegueWithIdentifier("questionsControllerSegue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "questionsControllerSegue"{
            
            let controller = segue.destinationViewController as! QuestionsViewController
            
            controller.currentDate = currentDate
                
        }
    }
    
}
