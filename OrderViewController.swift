//
//  OrderViewController.swift
//  CoreApplicationPrototype
//
//  Created by Jason Custodio on 3/11/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    // Create confirmation alert function
    func createAlert(title: String, message: String, action: UIAlertAction){
        
        // Alert style confirmation
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // Handler used to transition to other code, cancel confirmation
        let noButton  = UIAlertAction(title: "NO",  style: UIAlertActionStyle.destructive, handler: nil)
        
        alert.addAction(action)     // Add YES button to Alert controller
        alert.addAction(noButton)   // Add NO  button to Alert controller
        
        // Completion: do something after alert is displayed
        present(alert, animated: true, completion: nil)  // Display Alert
    }
 
  
    @IBAction func OrderOnline() {
        
        let inputTitle   = "WEBSITE TRANSFER"
        let inputMessage = "Do you want to open this website in Safari?"
        
        let link = "https://www.paulsenspharmacy.com/services/concierge"
        // Action Handler to open URL
        let yesButton = UIAlertAction(title: "YES", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction) -> Void in
            UIApplication.shared.open(NSURL(string: link)! as URL)
        })
        
        createAlert(title: inputTitle, message: inputMessage, action: yesButton)
    }
}
