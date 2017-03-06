//
//  DealsViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 1/20/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class DealsViewController: UIViewController {

    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this is where we will load up info the each daily deal
        //mainImage.image = #imageLiteral(resourceName: "1dailydeal")              //temp code
        //mainLabel.text = restorationIdentifier     //temp code
        

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
