//
//  Hike.swift
//  TableViewTestApp
//
//  Created by Taylor Frost on 7/26/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class Hike: NSObject {
    
    var hikeid:String = ""
    var hike_name:String = ""
    var picture = ""
    var difficulty:Int = 0
    var location:String = ""
    var info:String = ""
    var milage:String = ""
    var elevation_change:String = ""
    
    override init() {
        self.hikeid = ""
        self.hike_name = ""
        self.picture = ""
        self.difficulty = 0
        self.location = ""
        self.info = ""
        self.milage = ""
        self.elevation_change = ""
        
    }

}
