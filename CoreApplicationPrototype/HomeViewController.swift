//
//  ViewController.swift
//  CoreApplicationPrototype
//
//  Created by Thaddeus Sundin on 11/21/16.
//  Copyright © 2016 InboundRXCapstone. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    var userTotalRewardPoints = 0
    
    
      
    
    
    @IBOutlet weak var rewardLabel: UILabel!
    
    @IBOutlet weak var rewardPointsLabel: UILabel!
    
    func updateHomeUI() {
        //fetch users total points
        userTotalRewardPoints = 20 //dummy data
        //update points label
        rewardPointsLabel.text = String(userTotalRewardPoints)
        //FUTURE - retrieve and update deals table
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateHomeUI()
        
        let button = UIButton(frame: CGRect(x: 100, y: 150, width: 150, height: 50))
        button.setTitle("Send Notification", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(sendNotification), for: .touchUpInside)
        self.view.addSubview(button)

        //let delegate = UIApplication.shared.delegate as? AppDelegate
        //delegate?.callNotification()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Test In App Notification with button
    func sendNotification()
    {
        UserNotificationManager.shared.addNotification()
    }
}

