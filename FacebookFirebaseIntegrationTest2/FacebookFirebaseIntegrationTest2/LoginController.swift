//
//  ViewController.swift
//  FacebookFirebaseIntegrationTest2
//
//  Created by Taylor Frost on 8/1/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit

class LoginController: UIViewController, FBSDKLoginButtonDelegate, UITextFieldDelegate {

    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    
    @IBOutlet weak var emailLoginTextField: UITextField!
    
    @IBOutlet weak var passwordLoginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        facebookLoginButton.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        self.emailLoginTextField.delegate = self
        
        if let user = FIRAuth.auth()?.currentUser {
            
            print("I am signed in as user \(user.email)")
            
            
        } else {
            
            print("I am not signed in")
            
        }
        
    }
    
    func signOutUser() {
        
        try! FIRAuth.auth()!.signOut()
        
    }
    
    func signInUser(email: String, password: String) {
        
        FIRAuth.auth()?.signInWithEmail(email, password: password) {
            
            (user, error) in
            
            if error != nil {
                
                print(error?.localizedDescription)
                print("Sorry, this user hasn't been registered!")
                self.alertController()
            }
            
            if let user = user {
                
                print("\(user.email) signed in!")
                
                self.performSegueWithIdentifier("LoginToHikeTableview", sender: self)
                
            }
        }
    }
    
 
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error != nil {
            print(error!.localizedDescription)
            return
        } else {
            let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
            FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                    return
                } else {
                    
                     self.performSegueWithIdentifier("LoginToHikeTableview", sender: self)
                    
                    print("User logged in with facebook")
                    
                }
                
            })
        }
        
    }
    
    func alertController() {
        
        let alertController = UIAlertController(title: "Sorry!", message: "We don't recognize this login.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let saveAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {
            alert -> Void in
        })
        
        alertController.addAction(saveAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        try! FIRAuth.auth()?.signOut()
        
        print("User logged out of Facebook")
        
    }
    
    @IBAction func signInButtonTapped(sender: UIButton) {
        
        let emailSignIn = emailLoginTextField.text
        let passwordSignIn = passwordLoginTextField.text
        
        if let passwordSignIn = passwordSignIn {
            if let emailSignIn = emailSignIn {
                signInUser(emailSignIn, password: passwordSignIn)
                
            } else {
                print("Invalid email")
                
            }
            
        } else {
            
            print("Invalid password")
        }
  
    }
    
    @IBAction func signUpButtonTapped(sender: UIButton) {
        
    performSegueWithIdentifier("SignUpSegue", sender: self)
        
    }
    
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }


}

