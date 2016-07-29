//
//  ViewController.swift
//  MailGunPracticeApp
//
//  Created by Taylor Frost on 7/28/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func test() {
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: NSURL(string: "https://api.mailgun.net/v3/sandboxsandbox15b966c5e1f04765a67dcbc623dec3d6.mailgun.org/messages")!)
        request.HTTPMethod = "POST"
        let data = "from: Taylor <sandbox15b966c5e1f04765a67dcbc623dec3d6.mailgun.org>&to: [taylorhamblinfrost@gmail.com,sandbox15b966c5e1f04765a67dcbc623dec3d6]&subject:Hello&text:Testing some Mailgun awesomness!"
        request.HTTPBody = data.dataUsingEncoding(NSASCIIStringEncoding)
        request.setValue("key-7c8d416c92002ee0e9d3bf7c1132edc5-sandbox15b966c5e1f04765a67dcbc623dec3d6", forHTTPHeaderField: "api")
        let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            
            if let error = error {
                print(error)
            }
            if let response = response {
                print("url = \(response.URL!)")
                print("response = \(response)")
                let httpResponse = response as! NSHTTPURLResponse
                print("response code = \(httpResponse.statusCode)")
            }
 
        })
        task.resume()
    }

    @IBAction func sendEmailButtonTapped(sender: UIButton) {
        
        self.test()
    }

}

