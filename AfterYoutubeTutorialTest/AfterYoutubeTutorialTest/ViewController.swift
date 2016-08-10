//
//  ViewController.swift
//  AfterYoutubeTutorialTest
//
//  Created by Taylor Frost on 7/31/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBOutlet weak var buttonThree: UIButton!
    
    @IBOutlet weak var buttonFour: UIButton!
    

    let conditionRef = FIRDatabase.database().reference().child("condition")
    let secondConditionRef = FIRDatabase.database().reference().child("secondDate")
    let thirdConditionRef = FIRDatabase.database().reference().child("thirdDate")
    let fourthConditionRef = FIRDatabase.database().reference().child("fourthDate")

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.conditionRef.observeEventType(.Value){ (snap: FIRDataSnapshot) in
            self.buttonOne.setTitle(snap.value?.description, forState: UIControlState.Normal)
            
        self.secondConditionRef.observeEventType(.Value){ (snap: FIRDataSnapshot) in
            self.buttonTwo.setTitle(snap.value?.description, forState: UIControlState.Normal)
           
        self.thirdConditionRef.observeEventType(.Value){ (snap: FIRDataSnapshot) in
            self.buttonThree.setTitle(snap.value?.description, forState: UIControlState.Normal)
            
        self.fourthConditionRef.observeEventType(.Value){ (snap: FIRDataSnapshot) in
            self.buttonFour.setTitle(snap.value?.description, forState: UIControlState.Normal)
            
                    }
                }

            }

        }

    }
    
    @IBAction func buttonOneTapped(sender: UIButton) {
        self.conditionRef.removeValue()
        
    }
    
    @IBAction func buttonTwoTapped(sender: UIButton) {
        self.secondConditionRef.removeValue()
 
    }
    
    @IBAction func buttonThreeTapped(sender: UIButton) {
        self.thirdConditionRef.removeValue()
 
    }
    
    @IBAction func buttonFourTapped(sender: UIButton) {
        self.fourthConditionRef.removeValue()
  
    }
    
//    for index in yesArray {
//    
//    
//    }


}