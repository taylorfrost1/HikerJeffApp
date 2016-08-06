//
//  QuestionsViewController.swift
//  FacebookFirebaseIntegrationTest2
//
//  Created by Taylor Frost on 8/6/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var numberInPartyTextField: UITextField!
    
    @IBOutlet weak var fitnessTextField: UITextField!
    
    @IBOutlet weak var continueButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButton.layer.cornerRadius = 10
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(QuestionsViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)

    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    @IBAction func continueButtonTapped(sender: UIButton) {
        
        performSegueWithIdentifier("disclaimerControllerSegue", sender: self)
        
    }
    

}
