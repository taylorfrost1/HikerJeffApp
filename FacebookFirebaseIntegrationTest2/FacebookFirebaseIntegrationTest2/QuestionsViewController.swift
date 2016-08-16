//
//  QuestionsViewController.swift
//  FacebookFirebaseIntegrationTest2
//
//  Created by Taylor Frost on 8/6/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import MessageUI

class QuestionsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var numberInPartyTextField: UITextField!
    
    @IBOutlet weak var fitnessTextField: UITextField!
    
    @IBOutlet weak var continueButton: UIButton!
    
    var currentDate = Date()
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "navkanabhikerIcon")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        continueButton.layer.cornerRadius = 10
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(QuestionsViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)

    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    @IBAction func continueButtonTapped(sender: UIButton) {
        
        if nameTextField.text != "" && phoneNumberTextField.text != "" && emailAddressTextField.text != "" && numberInPartyTextField.text != "" && fitnessTextField.text != "" {
            
            self.makeMailComposer()
    
        } else {
            
            alertController()
 
        }
        
        
   
    }
    
    func alertController() {
        
        let alertController = UIAlertController(title: "Sorry!", message: "Please complete all fields before pressing continue.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let saveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {
            alert -> Void in
        })
        
        alertController.addAction(saveAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func makeMailComposer() {
        
        let emailTitle = "Reserve a Hike"
        let reciepients = ["hikerjeff@gmail.com"]
        
        let mailControllerInstance = MFMailComposeViewController()
        
        mailControllerInstance.mailComposeDelegate = self
        
        if MFMailComposeViewController.canSendMail(){
            
            mailControllerInstance.setSubject(emailTitle)
            mailControllerInstance.setMessageBody("Hi my name is \(nameTextField.text!). My phone number is \(phoneNumberTextField.text!). The hike I'd like to go on is \(emailAddressTextField.text!) and on this day \(numberInPartyTextField.text!). The number in my party is \(fitnessTextField.text!).", isHTML: false)
            
            mailControllerInstance.setToRecipients(reciepients)
            
            self.presentViewController(mailControllerInstance, animated: true, completion: {
                
                self.currentDate.ref?.updateChildValues([
                    
                    "taken":true
                
                    
                    ])

            })
            
        } else {
            
           print("cannot send mail")
            
        }
        
//        performSegueWithIdentifier("thankYouControllerSegue", sender: self)
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch (result)
        {
            
        case MFMailComposeResultCancelled:
            
            break
            
        case MFMailComposeResultSaved:
            
            break
            
        case MFMailComposeResultSent:
            
            performSegueWithIdentifier("thankYouControllerSegue", sender: self)
            
            break
            
        case MFMailComposeResultFailed:
            
            print("Mail sent failure: \(error)")
            break
            
        default:
            
            break
            
        }
        
//        performSegueWithIdentifier("thankYouControllerSegue", sender: self)
        
        self.dismissViewControllerAnimated(true, completion: nil)
//
//        for controller in (self.navigationController?.viewControllers)! {
//            
//            if controller.isKindOfClass(HikeController) {
//                
//                self.navigationController?.popToViewController(controller, animated: true)
//                
//            }
//        }

    }

}
