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
//        set{ rewardPointsLabel.text = String(newValue)}
        
    }
    
    @IBAction func unwindtoHome(segue:UIStoryboardSegue) { }

   
 
    
    
    
    internal func updateHomeUI() {
        //fetch users total points
//        userTotalRewardPoints = 20 //dummy data
        //update points label
//        rewardPointsLabel.text = String(rewardPoints)
        //FUTURE - retrieve and update deals table
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateHomeUI()
        
        
        /*
        webCallController.printBeaconList()
        webCallController.getBeaconList { (beaconList) in
            if beaconList != nil {
                var i = 0
                for dict in beaconList! {
                    print("Dictionary \(i):")
                    print(dict)
                    print("\n---\n")
                    i = i+1
                }
            }
        }
        
        
        webCallController.getHistoricalEventList { (historicalEventsList) in
            if historicalEventsList != nil {
                var i = 0
                for dict in historicalEventsList! {
                    print("Event \(i):")
                    print(dict)
                    print("\n---\n")
                    i = i+1
                }
            }
        }
        webCallController.userLogOut()
        webCallController.getUserPoints { (points) in
            if((points) != nil) {
                print("\n\nUser points after logging out: "+points!+"\n\n")
            }
        }
        
        webCallController.getDailyDealList { (dailyDealList) in
            if dailyDealList != nil {
                var i = 0
                for dict in dailyDealList! {
                    print("Daily deal \(i):")
                    print(dict)
                    print("\n---\n")
                    i = i+1
                }
            }
        }
 
        */


        //let delegate = UIApplication.shared.delegate as? AppDelegate
        //delegate?.callNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateHomeUI()
        
        
        //let delegate = UIApplication.shared.delegate as? AppDelegate
        //delegate?.callNotification()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

