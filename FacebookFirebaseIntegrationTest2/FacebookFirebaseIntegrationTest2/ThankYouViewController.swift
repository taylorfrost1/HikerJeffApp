//
//  ThankYouViewController.swift
//  FacebookFirebaseIntegrationTest2
//
//  Created by Taylor Frost on 8/13/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class ThankYouViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        
        self.navigationController?.navigationBarHidden = true
    }
    
    func timeToMoveOn() {
        
        for controller in (self.navigationController?.viewControllers)! {
            
            if controller.isKindOfClass(HikeController) {
                
                self.navigationController?.popToViewController(controller, animated: true)
                
            }
        }
    }
    

}
