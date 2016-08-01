//
//  ViewController.swift
//  FirebaseTestAppYoutubeTutorial
//
//  Created by Taylor Frost on 7/31/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var conditionLabel: UILabel!
    
    let conditionRef = FIRDatabase.database().reference().child("condition")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)

        conditionRef.observeEventType(.Value){ (snap: FIRDataSnapshot) in
            self.conditionLabel.text = snap.value?.description

        }
    }
    
    @IBAction func sunnyDidTouch(sender: UIButton) {
        self.conditionRef.setValue("Sunny")
        
    }
    
    @IBAction func foggyDidTouch(sender: UIButton) {
        self.conditionRef.setValue("Foggy")
    }
    
    

}

