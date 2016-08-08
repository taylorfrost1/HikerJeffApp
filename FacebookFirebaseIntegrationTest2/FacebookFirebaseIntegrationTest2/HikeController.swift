//
//  HikeTableviewViewController.swift
//  FacebookFirebaseIntegrationTest2
//
//  Created by Taylor Frost on 8/3/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class HikeController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
                                
                                if let difficulty = dict["difficulty"] as? String{
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! HikeTableViewCell
        
        self.currentHike = self.hikeArray[indexPath.row]
        
        cell.hikeName.text = currentHike.hike_name
        
        cell.hikeImageView.image = UIImage(named: currentHike.picture)
        
        cell.difficultyLevelLabel.text = currentHike.difficulty
        
        cell.locationLabel.text = currentHike.location

        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.currentHike = self.hikeArray[indexPath.row]
        
        performSegueWithIdentifier("HikeToDetailHikeSegue", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if (segue.identifier == "HikeToDetailHikeSegue") {
            
            if let controller = segue.destinationViewController as? DetailHikeViewController{
                
                controller.detailVariable = self.currentHike
                
                print("The values should be passing")
                
            }
        }
        
    }

}
