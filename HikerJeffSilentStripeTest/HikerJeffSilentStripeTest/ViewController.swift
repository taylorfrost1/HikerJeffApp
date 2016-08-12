//
//  ViewController.swift
//  HikerJeffSilentStripeTest
//
//  Created by Taylor Frost on 8/9/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Stripe
import Alamofire

class ViewController: UIViewController, STPPaymentCardTextFieldDelegate {
    
    @IBOutlet weak var payButtonOutlet: UIButton!
    
    let paymentTextField = STPPaymentCardTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentTextField.frame = CGRectMake(15, 199, CGRectGetWidth(self.view.frame)-30, 44)
        paymentTextField.delegate = self
        view.addSubview(paymentTextField)
        self.payButtonOutlet.hidden = true

        
    }
    
    func paymentCardTextFieldDidChange(textField: STPPaymentCardTextField) {
        if textField.valid {
            self.payButtonOutlet.hidden = false
            
        }
    }
 
    @IBAction func paymentButtonAction(sender: AnyObject) {
        
        let card = paymentTextField.cardParams
        
        STPAPIClient.sharedClient().createTokenWithCard(card, completion: {(token, error) -> Void in
            if let error = error {
                print(error)
            }
            else if let token = token {
                print(token)
                self.chargeUsingToken(token)
            }
            
        })
        
    }
    
    func chargeUsingToken(token:STPToken){
        let requestString = "https://desolate-gorge-63490.herokuapp.com"
        let params = ["stripeToken": token.tokenId, "amount": "200", "currency": "usd", "description": "testRun"]
        
        let request = Alamofire.request(.POST, requestString, parameters: params)
            .responseString { response in
                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
//
//                
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                    
//                } else {
//                    print("The JSON could not be displayed")
//                }
            }
        debugPrint(request)
        }

    }

