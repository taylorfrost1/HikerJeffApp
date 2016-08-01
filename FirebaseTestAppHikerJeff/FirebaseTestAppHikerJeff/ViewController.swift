//
//  ViewController.swift
//  FirebaseTestAppHikerJeff
//
//  Created by Taylor Frost on 7/25/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var reservationsArray = [Reservations]()
    var currentReservation = Reservations()
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observePosts()

    }
    
    func observePosts() {
        let ref = FIRDatabase.database().reference()
        
        ref.child("reservations").observeEventType(.Value, withBlock: {
            
            (snapshot) in
            
            self.reservationsArray = []
            
            
            
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshots {
                    if let dict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Reservations(key: key, dict: dict)
                        
                        
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            self.reservationsArray.insert(post, atIndex: 0)
                            print("Count == \(self.reservationsArray.count)")
                            self.tableViewOutlet.reloadData()
                           
                        })
                        
                    }
                }
            }
        })
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.reservationsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        self.currentReservation = self.reservationsArray[indexPath.row]
        
        cell.textLabel?.text = currentReservation.date

        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:
        NSIndexPath) {
        
        self.currentReservation = self.reservationsArray[indexPath.row]
        
        performSegueWithIdentifier("informationInputSegue", sender: nil)
        
 
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "informationInputSegue") {
            
            if let controller = segue.destinationViewController as? InformationInputViewController{
                
                controller.informationVariable = self.currentReservation
                
                print("The reservation should be passing")
            }
   
        }
    }
    
    func testFunction() {
        
        
        
        
    }

}