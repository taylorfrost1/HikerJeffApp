//
//  User.swift
//  DataModelsAndJsonForProject
//
//  Created by Taylor Frost on 7/23/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var uid:String = ""
    var name:String = ""
    var phoneNumber:Int = 0
    var emailAddress:String = ""
    var numberOfPeopleInParty:Int = 0
    var fitnessLevelOfParty:String = ""
    
    override init() {
        self.uid = ""
        self.name = ""
        self.phoneNumber = 0
        self.emailAddress = ""
        self.numberOfPeopleInParty = 0
        self.fitnessLevelOfParty = ""
    }

}
