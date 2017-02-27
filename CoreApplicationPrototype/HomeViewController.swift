//
//  ViewController.swift
//  CoreApplicationPrototype
//
//  Created by Thaddeus Sundin on 11/21/16.
//  Copyright © 2016 InboundRXCapstone. All rights reserved.
//

import UIKit

var rewardPoints = 0

class HomeViewController: UIViewController {

    let webCallController = WebCallController()
    
    var userTotalRewardPoints: Int {
        get{return rewardPoints}
        set{ rewardPointsLabel.text = String(newValue)}
        
    }
    
    
    @IBOutlet weak var rewardLabel: UILabel!
    
    @IBOutlet weak var rewardPointsLabel: UILabel!
    
    internal func updateHomeUI() {
        //fetch users total points
        userTotalRewardPoints = 20 //dummy data
        //update points label
        rewardPointsLabel.text = String(rewardPoints)
        //FUTURE - retrieve and update deals table
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateHomeUI()
        webCallController.printBeaconList()

        //let delegate = UIApplication.shared.delegate as? AppDelegate
        //delegate?.callNotification()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

