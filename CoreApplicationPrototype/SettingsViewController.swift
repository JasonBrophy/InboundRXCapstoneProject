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
    
    func logOutPush(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        let result = user.logOut()
        if(!result.0){
            let alertController = UIAlertController(title: "Error", message: result.1, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated:true, completion:nil)
        }
        else{
         
        }
        
    }
    
    @IBAction func handleLogTouch() {
        if(logButton.currentTitle == "Log In"){
        }
        else{
            self.logOutPush()
            self.logButton.setTitle("Log In", for: UIControlState.normal)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        if user.loggedIn(){
            logButton.setTitle("Log Out", for: UIControlState.normal)
        }
        else{
            logButton.setTitle("Log In", for: UIControlState.normal)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        if user.loggedIn(){
            logButton.setTitle("Log Out", for: UIControlState.normal)
        }
        else{
            logButton.setTitle("Log In", for: UIControlState.normal
            )
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
