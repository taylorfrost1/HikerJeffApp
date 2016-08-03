//
//  ViewController.swift
//  UIMessageTestApp
//
//  Created by Taylor Frost on 7/25/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var body: UITextView!
    @IBOutlet weak var subject: UITextField!
    let hello = "Dude you totally got to learn to code"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        body.hidden = true
        subject.hidden = true
    
    
    }

    @IBAction func sendEmail(sender: UIButton) {
       
        var subjectText = "This is Jared"
        subjectText += subject.text!
        
        let messageBody = "Hello whats going on you amazing man! \(hello)"
        
        let toRecipients = ["taylorhamblinfrost@gmail.com"]
        
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        
        mc.mailComposeDelegate = self
        mc.setSubject(subjectText)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(toRecipients)
        
        self.presentViewController(mc, animated: true, completion: nil)
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result{
            
//        case MFMailComposeResultCancelled:
//            print("Mail Cancelled")
//        case MFMailComposeResultSaved:
//            print("Mail Saved")
////        case is MFMailComposeResult:
////            print("Mail Sent")
//        case MFMailComposeResultFailed:
//            print("Mail Sent Failure: %@", [error?.localizedDescription])
   
        default:
            break
            
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

