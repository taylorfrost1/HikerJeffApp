//
//  ViewController.swift
//  TableViewTestApp
//
//  Created by Taylor Frost on 7/26/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    typealias JSONDictionary = [String:AnyObject]
    typealias JSONArray = [JSONDictionary]
    var hikeArray = [Hike]()
    var currentHike = Hike()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = NSBundle.mainBundle().URLForResource("hikes", withExtension: "json") {
            
            if let data = NSData(contentsOfURL: filePath) {
                
                do {
                    
                    if let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                        
                        print(jsonDict)
                        
                        if let resultsArray = jsonDict["results"] as? JSONArray {
                            
                            for dict in resultsArray {
                                
                                let theHike = Hike()
                                
                                self.hikeArray.append(theHike)
                                
                                if let hikeName = dict["hike_name"] as? String {
                                    theHike.hike_name = hikeName
                                    
                                } else {
                                    print("The hikes cannot be parsed")
                                }
                                
                                if let picture = dict["picture"] as? String{
                                    theHike.picture = picture
                                } else {
                                    print("I could not parse the pictures")
                                }
                                
                                if let difficulty = dict["difficulty"] as? Int{
                                    theHike.difficulty = difficulty
                                } else {
                                    print("The difficulty could not be parsed")
                                }
                                
                                if let location = dict["location"] as? String{
                                    theHike.location = location
                                } else {
                                    print("The location could not be parsed")
                                }
                                
                                if let info = dict["info"] as? String{
                                    theHike.info = info
                                } else {
                                    print("The info could not be parsed")
                                }
                                
                                if let milage = dict["milage"] as? String{
                                    theHike.milage = milage
                                } else {
                                    print("The milage could not be parsed")
                                }
                                
                                if let elevationChange = dict["elevation_change"] as? String{
                                    theHike.elevation_change = elevationChange
                                } else {
                                    print("The elevationChange could not be parsed")
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                } catch {
                    print("Something went wrong parsing the data")
                }
            }
            
        } else {
            
            print("The file could not be parsed")
        }
        
        print(hikeArray.count)
        
        for theHike in hikeArray {
            print(theHike.hike_name)
        }
        
        
    }
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
        return self.hikeArray.count
            
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! HikerTableViewCell
        
        self.currentHike = self.hikeArray[indexPath.row]
        
//        cell.textLabel?.text = hike.hike_name
        
        cell.pictureImageView.image = UIImage(named: currentHike.picture)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
    }

}

