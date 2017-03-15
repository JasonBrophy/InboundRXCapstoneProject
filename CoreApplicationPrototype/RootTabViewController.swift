//
//  RootTabViewController.swift
//  CoreApplicationPrototype
//
//  InboundRX iOS RFID Beacon Detecting Application
//  https://gitlab.com/InboundRX-Capstone/Paulsens-iOS-App
//
//  (c) 2017 Brett Chafin, Jason Brophy, Luke Kwak, Paul Huynh, Jason Custodio, Cher Moua, Thaddeus Sundin
//
//  You are free to use, copy, modify, and distribute this file, with attribution,
//  under the terms of the MIT license. See "license.txt" for more info.


/*
 Checks if the user is logged in then allows access to the Rewards page.
 If user is not logged in then an alert will prompt the user to log in or cancel.
 If cancel the user will stay in the same page, else segue to the log in screen
*/

import UIKit

class RootTabViewController: UITabBarController{

    /************ View Outlets **********/
    
    @IBOutlet weak var rootTabBar: UITabBar!
    
    /************ Default Controller Functions *********/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension RootTabViewController: UITabBarControllerDelegate{
    
    /************ Overridden Delegate Functions *********/

    
    // If the selected tab bar item is the Rewards item, do the contained test for login, otherwise behave normally
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            if(item.title == "Rewards"){
            
            // Get the global application user to check login
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let user = appDelegate.user
            
            // If the user is not logged in, pop up an error offering to take them to the login screen
            // or they can cancel to remain on the same screen instead of showing the rewards screen.
            if(!user.loggedIn()){
                let inputTitle = "Error"
                let inputMessage = "You need to be logged in to access the rewards page"
                let alert = UIAlertController(title: inputTitle, message: inputMessage, preferredStyle: UIAlertControllerStyle.alert)
            
                // Handler used to transition to login
                let loginButton = UIAlertAction(title: "Login", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction) -> Void in
                self.performSegue(withIdentifier: "tabToLogin", sender: self)
                })
            
                // Handler to dismiss
                let cancelButton  = UIAlertAction(title: "Cancel",  style: UIAlertActionStyle.cancel, handler: {(ACTION) in
                alert.dismiss(animated: true, completion: nil)})
            
                alert.addAction(cancelButton)  // Add cancel button to Alert controller
                alert.addAction(loginButton)   // Add login  button to Alert controller
            
                // Completion: do something after alert is displayed
                present(alert, animated: true, completion: nil)  // Display Alert
            }
        }
    }
    
    // Override the delegate select allowance to only allow access to rewards if the user is logged in.
    // Returning false in the instance they are attempting to go to rewards while not logged in
    // prevents the navigation from taking place.  In all other cases, return true to allow the transition.
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        if(rootTabBar.selectedItem!.title == "Rewards"){
            if(!user.loggedIn()){
                return false
            }
        }
        return true
    }
}
