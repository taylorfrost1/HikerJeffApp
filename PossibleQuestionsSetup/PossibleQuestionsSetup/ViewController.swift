//
//  ViewController.swift
//  PossibleQuestionsSetup
//
//  Created by Taylor Frost on 7/27/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextFieldOutlet: UITextField!
    
    @IBOutlet weak var phoneNumberTextFieldOutlet: UITextField!
    
    @IBOutlet weak var emailAddressTextFieldOutlet: UITextField!
    
    @IBOutlet weak var numberInPartyTextFieldOutlet: UITextField!
    
    @IBOutlet weak var fitnessLevelTextFieldOutlet: UITextField!

    @IBOutlet weak var continueButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButton.layer.cornerRadius = 10
        
        

    }
    

}

