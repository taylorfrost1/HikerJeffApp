//
//  SignUpViewController.swift
//  FacebookFirebaseIntegrationTest2
//
//  Created by Taylor Frost on 8/3/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailSignUpTextField: UITextField!
    
    @IBOutlet weak var passwordSignUpTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        

    }
    
    @IBAction func signUpButtonTapped(sender: UIButton) {
        
        let emailSignUp = emailSignUpTextField.text
        let passwordSignUp = passwordSignUpTextField.text
        
        if let emailSignUp = emailSignUp {
            if let passwordSignUp = passwordSignUp {
                createUser(emailSignUp, password: passwordSignUp)
                
            }
        }
    }
    
    
    func createUser(email: String, password: String) {
        
        FIRAuth.auth()?.createUserWithEmail(email, password: password) {
            
            (user, error) in
            
            if error != nil{
                print(error?.localizedDescription)
                self.alertController()
            }
            
            if let user = user{
                
                print(user.uid)
                print("Success! Create user \(email)")
                self.performSegueWithIdentifier("SignUpToSignInSegue", sender: self)
                
            }
            
        }
    }
    
    func alertController() {
        
        let alertController = UIAlertController(title: "Sorry!", message: "Your email or password isn't in a form we can use.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let saveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {
            alert -> Void in
        })
        
        alertController.addAction(saveAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    @IBAction func signInButtonTapped(sender: UIButton) {
        
        performSegueWithIdentifier("SignUpToSignInSegue", sender: self)
    }

}
