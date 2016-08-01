//
//  InformationInputViewController.swift
//  FirebaseTestAppHikerJeff
//
//  Created by Taylor Frost on 7/31/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class InformationInputViewController: UIViewController {
    
    var informationVariable: Reservations?

    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var phoneNumberOutlet: UITextField!
    
    @IBOutlet weak var emailOutlet: UITextField!
    
    @IBOutlet weak var numberInPartyOutlet: UITextField!
    
    @IBOutlet weak var fitnessLevelOfPartyOutlet: UITextField!
    
    @IBOutlet weak var continueButtonOutlet: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
         continueButtonOutlet.layer.cornerRadius = 10
        

    }
    
    @IBAction func continueButtonTapped(sender: UIButton) {
        
        
    }
    

}
