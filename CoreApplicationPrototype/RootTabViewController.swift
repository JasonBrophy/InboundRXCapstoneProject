//
//  RootTabViewController.swift
//  CoreApplicationPrototype
//
//  Created by Jason Brophy on 2/25/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class RootTabViewController: UITabBarController {

    @IBOutlet weak var rootTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rewardsTabItems = rootTabBar.items
        let rewardsItem = rewardsTabItems![1]
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        if(!user.loggedIn()){
            rewardsItem.isEnabled = false
        }
        else{
            rewardsItem.isEnabled = true
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let rewardsTabItems = rootTabBar.items
        let rewardsItem = rewardsTabItems![1]
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        if(!user.loggedIn()){
            rewardsItem.isEnabled = false
        }
        else{
            rewardsItem.isEnabled = true
        }

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
