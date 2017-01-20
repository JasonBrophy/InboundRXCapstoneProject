//
//  DealsViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 1/19/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class DealsViewController: UIViewController {


    @IBOutlet weak var mainTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTitle.text = self.restorationIdentifier
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
