//
//  AboutViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 1/10/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    //Variables
    @IBOutlet weak var UIAboutTextView: UITextView!
    
    
    
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
        
        UIAboutTextView.text = "Paulsen's Pharmacy\n\n"+"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.\n\n"+"https://www.paulsenspharmacy.com\n\n"+"4246 NE Sandy Blvd \nPortland, OR\n\n"+"(503)287-1163\n\n"+"Monday - Friday 9:00am - 6:30pm\nSaturday 10:00am - 2:00pm"
        
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
