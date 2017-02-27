//
//  PopUpViewController.swift
//  CoreApplicationPrototype
//
//  Created by Cher Moua on 2/26/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    var images = [UIImage(named: "1reward"),UIImage(named: "2reward"),UIImage(named: "3reward"),UIImage(named: "4reward"),UIImage(named: "5reward")]
    var productTitles: [String] = ["Product 1", "Product 2", "Product 3", "Product 4", "Product 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        self.view.removeFromSuperview()
    }


}
