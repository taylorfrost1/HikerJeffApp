//
//  ViewController.swift
//  PaypalPracticeApp
//
//  Created by Taylor Frost on 7/31/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PayPalPaymentDelegate {
    
    var payPalConfig = PayPalConfiguration()
    
    var environment: String = PayPalEnvironmentNoNetwork{
        willSet(newEnvironment){
            if(newEnvironment != environment) {
                PayPalMobile.preconnectWithEnvironment(newEnvironment)
            }
        }
    }
    
    var acceptCreditCards:Bool = true {
        didSet{
            payPalConfig.acceptCreditCards = acceptCreditCards
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        payPalConfig.acceptCreditCards = acceptCreditCards
        payPalConfig.merchantName = "Frost Industries"
        payPalConfig.merchantPrivacyPolicyURL = NSURL(string:"http://taylorfrostblog.wordpress.com")
        payPalConfig.merchantUserAgreementURL = NSURL(string:"http://taylorfrostblog.wordpress.com")
        payPalConfig.payPalShippingAddressOption = .PayPal
        PayPalMobile.preconnectWithEnvironment(environment)
        
        
    }
    
    func payPalPaymentDidCancel(paymentViewController: PayPalPaymentViewController!) {
        print("Paypal payment cancelled")
        paymentViewController?.dismissViewControllerAnimated(true, completion: nil)
  
    }
    
    func payPalPaymentViewController(paymentViewController: PayPalPaymentViewController!, didCompletePayment completedPayment: PayPalPayment!) {
        print("PayPal payment success!")
        paymentViewController?.dismissViewControllerAnimated(true, completion: { () -> Void in
            
            print("This is your proof of payment:\n\n\(completedPayment.confirmation)\n\nSend this to your server for confirmation and fulmillment.")
            
        })
        
    }

    @IBAction func payButtonTapped(sender: UIButton) {
        
        let item1 = PayPalItem(name:"Taylor Frost Test Item", withQuantity: 1, withPrice: NSDecimalNumber(string: "99.99"), withCurrency:"USD", withSku:"Taylor Frost-0001")
        
        let items = [item1]
        let subtotal = PayPalItem.totalPriceForItems(items)
        
        let shipping = NSDecimalNumber(string: "0.00")
        let tax = NSDecimalNumber(string: "0.00")
        let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
        
        let total = subtotal.decimalNumberByAdding(shipping).decimalNumberByAdding(tax)
        
        let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "Taylor Frost Test", intent: .Sale)
        
        payment.items = items
        payment.paymentDetails = paymentDetails
        
        if (payment.processable){
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
            
            presentViewController(paymentViewController, animated: true, completion: nil)
            
        } else {
            
            print("Payment not processible: \(payment)")
        }
        
    }

}

