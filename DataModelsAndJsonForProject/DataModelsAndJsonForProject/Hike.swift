//
//  Hike.swift
//  DataModelsAndJsonForProject
//
//  Created by Taylor Frost on 7/23/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class Hike:NSObject {
    
    var hike_name:String = ""
    var picture:String = ""
    var difficulty:Int = 0
    var location:String = ""
    var info:String = ""
    var milage:String = ""
    var elevation_change:String = ""
    
    override init() {
        
        self.hike_name = ""
        self.picture = ""
        self.difficulty = 0
        self.location = ""
        self.info = ""
        self.milage = ""
        self.elevation_change = ""
       
    }

}
