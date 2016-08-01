//
//  Reservations.swift
//  FirebaseTestAppHikerJeff
//
//  Created by Taylor Frost on 7/29/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Reservations: NSObject {
    
    let ref = FIRDatabase.database().reference().child("reservations")
    
    var key:String = ""
    var uid : String = ""
    var hike: String = ""
    var date: String = ""
    
    override init() {
        
    }
    
    init(key: String, dict: Dictionary<String, AnyObject>) {
        
        self.key = key
        
        if let hike = dict["hike"] as? String {
            self.hike = hike
        }
        
        if let date = dict["date"] as? String {
            self.date = date
        }
    }
    
    func save() {
        
        let dict: [String:AnyObject] = [
            "hike": self.hike,
            "date": self.date
        ]
        
        let postRef = self.ref.childByAutoId()
        postRef.setValue(dict)
        
    }

}
