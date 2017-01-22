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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationLabel.accessibilityIdentifier = "NotificationLabel"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
