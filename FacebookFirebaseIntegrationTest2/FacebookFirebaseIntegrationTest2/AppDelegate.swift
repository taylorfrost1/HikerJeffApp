//
//  AppDelegate.swift
//  FacebookFirebaseIntegrationTest2
//
//  Created by Taylor Frost on 8/1/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FirebaseDatabase



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var storyboard: UIStoryboard?
    var dateList = [Date]()
    var ref: FIRDatabaseReference!
    var refHandle: UInt!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
         FIRApp.configure()
        
        ref = FIRDatabase.database().reference()
        
        self.storyboard =  UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let currentUser = FIRAuth.auth()?.currentUser
        if currentUser != nil
        {
            self.window?.rootViewController = self.storyboard?.instantiateViewControllerWithIdentifier("NavigationController") as! UINavigationController
        }
        else {
            self.window?.rootViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LoginController")
        }
        
        self.fetchDates()
        
                return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        
         if(FBSDKAccessToken.currentAccessToken() != nil) {
        
            print("token isn't nil")
       
         } else {
            
            print("token is nil")
            
        }
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {
        
//        do {
//           try FIRAuth.auth()?.signOut()
//        } catch {
//            
//        }
        
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
        }

    func applicationDidBecomeActive(application: UIApplication) {

    }

    func applicationWillTerminate(application: UIApplication) {

    }

    func fetchDates(){
        
        refHandle = ref.child("Dates").observeEventType(.Value, withBlock: {(snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject]{
                
                self.dateList = []
                
                let formatter = NSDateFormatter()
                
                formatter.dateFormat = "MMMM d, yyyy"
                
                for item in dictionary {
                    
                    let dateString = item.0
                    
                    if let dateInfo = item.1 as? [String:AnyObject] {
                        
                        
                        if let taken = dateInfo["taken"] as? Bool {
                            
                            let date = Date()
                            
                            date.ref = self.ref.child("Dates").child(dateString)
                            
                            if let newDate = formatter.dateFromString(dateString) {
                                
                                date.date = newDate
                                
                            }
                            
                            date.taken = taken
                            
                            if taken == false {
                                
                                let todaysDate = NSDate()
                                
                                let dateInFuture = todaysDate.dateByAddingTimeInterval(7257600)
                                
                                if let dateToCheck = date.date {
                                    
                                    if dateToCheck.timeIntervalSince1970 > todaysDate.timeIntervalSince1970 && dateToCheck.timeIntervalSince1970 < dateInFuture.timeIntervalSince1970 {
                                        
                                        self.dateList.append(date)
                                        
                                    }
                                    
                                }
                                
                            }
                        }
                        
                    }
                    
                }
                
                self.dateList = self.dateList.sort {
                    $0.date?.timeIntervalSince1970 < $1.date?.timeIntervalSince1970
                }
             
                NSNotificationCenter.defaultCenter().postNotificationName("reloadTableviewData", object: nil)
            }
            
        })
        
    }
    

}

