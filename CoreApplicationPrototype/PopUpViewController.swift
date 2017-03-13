//
//  PopUpViewController.swift
//  CoreApplicationPrototype
//
//  Created by Cher Moua on 2/26/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    /************ Local Varibles ********/
    
    var product: Product? = nil //This is to be set upon passing control to this view by the external controller.
    
    /************ View Outlets **********/
    
    @IBOutlet weak var productTitle: UILabel! // The product title on the popup
    
    @IBOutlet weak var productCost: UILabel!  // The product cost on the popup
    
    @IBOutlet weak var productDesc: UILabel!  // The product description on the popup
    
    @IBOutlet weak var productRedeem: UIButton! //The popup redeem button
    
    @IBOutlet weak var productImage: UIImageView! //The image of the popup

    /************ View Actions **********/

    @IBAction func redeemReward(_ sender: Any) {
        //Nothing yet
    }
    
    
    // Dismiss the popup
    @IBAction func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    /************ Default Controller Functions *********/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the color behind the popup, then, update the fields with the passed
        // in products information.  This view will never reappear when dismissed without 
        // A did load, so no need to override WillAppear
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        if(product != nil){
            productTitle.text = product!.title
            productCost.text = String(product!.cost)
            productDesc.text = product!.description
            productImage.image = product!.image
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
