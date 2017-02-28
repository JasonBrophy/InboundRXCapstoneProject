//
//  PopUpViewController.swift
//  CoreApplicationPrototype
//
//  Created by Cher Moua on 2/26/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    var product: Product? = nil
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productCost: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    
    @IBOutlet weak var productRedeem: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        if(product != nil){
            productTitle.text = product!.title
            productCost.text = String(product!.cost)
            productDesc.text = product!.description
            productImage.image = product!.image
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func redeemReward(_ sender: Any) {
        //Nothing yet
    }
    
    @IBAction func dismissView() {
        //performSegue(withIdentifier: "unwindPopupToReward", sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
