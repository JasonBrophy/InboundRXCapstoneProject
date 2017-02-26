//
//  SettingsViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 1/10/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

   
    var notificationsOn = true
    
    @IBOutlet weak var NotificationLabel: UILabel!
    
    @IBOutlet weak var logButton: UIButton!
    
    @IBOutlet weak var acctMod: UIButton!
    
    @IBAction func toggleNotifications(_ sender: UISwitch) {
        if (sender.isOn)    {
            NotificationLabel.text = "Notifications: On"
            notificationsOn = true
        }
        else {
            NotificationLabel.text = "Notifications: Off"
            notificationsOn = false
        }
    }
    
    // If the user has pushed the logout button, log the user out, if there is a failure, display it.
    // This error is more app related than user related, so it is possible it should have different behavior.
    func logOutPush(){
        //Fetch the user from app delegate, then call the user logOut function.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        let result = user.logOut()
        //Present the error if the logOut function returned false, using the string portion of the tuple as the message.
        if(!result.0){
            let alertController = UIAlertController(title: "Error", message: result.1, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated:true, completion:nil)
        }
    }
    
    // This function operates differently depending on the status of the logButton
    // If the message is logout, it needs to perform the work in logOutPush, as the
    // User is requesting a logout.  The button title is then set to login.
    // Login actually requires the user login to guarantee the button title flip, so 
    // It is not done here.
    @IBAction func handleLogTouch() {
        // I would change this to be based on user login rather than button title
        // Feels like bad form
        let tbc = self.tabBarController as! RootTabViewController
        let rewardsTabItems = tbc.rootTabBar!.items
        let rewardsItem = rewardsTabItems![1]
        if(logButton.currentTitle == "Log Out"){
            // No error return required, if this function fails, its
            // because there was no user to logout, so the text should be flipped
            // regardless.
            self.logOutPush()
            self.logButton.setTitle("Log In", for: UIControlState.normal)
            rewardsItem.isEnabled = false
        }
    }
    
    // If the user hits the acctMod button, it has to do different behavior
    // based on whether a user is logged in or not.  It segues to the correct
    // view depending on that status.  If logged in, edit account, if logged out
    // to the create account.
    @IBAction func handleAcctTouch(_ sender: Any) {
        
        // Get the application user object
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        //If logged in, perform the editAccount segue, otherwise, perform the createAccount segue.
        if(user.loggedIn()){
            performSegue(withIdentifier: "editAccount", sender: self)
        }
        else{
            performSegue(withIdentifier: "createAccount", sender: self)
        }
    }
    
    // This function is overridden to update the view on appearance
    // This forces the login/logout and edit/create account buttons to take
    // the correct title depending on user login status.
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        if user.loggedIn(){
            logButton.setTitle("Log Out", for: UIControlState.normal)
            acctMod.setTitle("Edit Account", for: UIControlState.normal)
        }
        else{
            logButton.setTitle("Log In", for: UIControlState.normal)
            acctMod.setTitle("Create Account", for: UIControlState.normal)

        }
        
        
    }
    
    //Update the Notifcation Label based on Notification setting,
    // and logButton and acctMod button to the correct title depending on log status.
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if(notificationsOn){
            NotificationLabel.text = "Notifications: On"
        }
        else{
            NotificationLabel.text = "Notifications: Off"
        }
        let user = appDelegate.user
        if user.loggedIn(){
            logButton.setTitle("Log Out", for: UIControlState.normal)
            acctMod.setTitle("Edit Account", for: UIControlState.normal)
        }
        else{
            logButton.setTitle("Log In", for: UIControlState.normal)
            acctMod.setTitle("Create Account", for: UIControlState.normal)
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "logSegue"){
            self.handleLogTouch()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
