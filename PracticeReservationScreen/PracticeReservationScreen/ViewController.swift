//
//  ViewController.swift
//  PracticeReservationScreen
//
//  Created by Taylor Frost on 7/28/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dateArray = [Date]()
    var currentDate = Date(date:"")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dateData()

    }
    
    func dateData() {
        

        let firstDate = Date(date:"August 3, 2016")
        dateArray.append(firstDate)
        let secondDate = Date(date:"August 10, 2016")
        dateArray.append(secondDate)
        let thirdDate = Date(date:"August 17, 2016")
        dateArray.append(thirdDate)
        let fourthDate = Date(date:"August 24, 2016")
        dateArray.append(fourthDate)
        
    }
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return self.dateArray.count
            
            
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DateTableViewCell
        
        self.currentDate = self.dateArray[indexPath.row]
        
        cell.tableViewDateLabel.text = currentDate.date
        
        cell.tableViewDateLabel.layer.cornerRadius = 10
        
        cell.tableViewDateLabel.clipsToBounds = true
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        
    }
    


}

