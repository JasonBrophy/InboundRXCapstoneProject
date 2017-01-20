//
//  AboutViewController.swift
//  CoreApplicationPrototype
//
//  Created by Cher Moua on 1/10/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    //Variables
    
    @IBOutlet weak var UIAboutTextView: UITextView!
  
    // Create confirmation alert function
    func createAlert(title: String, message: String){
        
        // Alert style confirmation
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // Handler used to transition to other code
        let yesButton = UIAlertAction(title: "YES", style: UIAlertActionStyle.default, handler: nil)  // YES confirm
        let noButton  = UIAlertAction(title: "NO",  style: UIAlertActionStyle.default, handler: nil)  // NO
        
        alert.addAction(yesButton)  // Add YES button to Alert controller
        alert.addAction(noButton)   // Add NO  button to Alert controller
        
        // Completion: do something after alert is displayed
        present(alert, animated: true, completion: nil)  // Display Alert
    }
    
    // Safari Transfer confirmation
    @IBAction func url() {
        let inputTitle   = "WEBSITE TRANSFER"
        let inputMessage = "Do you want to open this website in Safari?"
        
        createAlert(title: inputTitle, message: inputMessage)
    }
    
    // Map Transfer confirmation
    @IBAction func address() {
        let inputTitle   = "MAP TRANSFER"
        let inputMessage = "Do you want to open this address in Maps?"
        
        createAlert(title: inputTitle, message: inputMessage)
    }
    
    // Phone Transfer confirmation
    @IBAction func phone() {
        let inputTitle   = "PHONE TRANSFER"
        let inputMessage = "Do you want to call this number?"
        
        createAlert(title: inputTitle, message: inputMessage)
    }
    
    //Overriding viewDidLayoutSubviews() so when app opens and
    //about and clicked the UIAboutTextView does not start in the middle
    //it'll start from the top
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        UIAboutTextView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.automaticallyAdjustsScrollViewInsets = false
        
        UIAboutTextView.text = "Paulsen's Pharmacy\n\n"+"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.\n\n"+"Monday - Friday 9:00am - 6:30pm\nSaturday 10:00am - 2:00pm"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
}
