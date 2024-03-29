//
//  PopUpViewController.swift
//  CoreApplicationPrototype
//
//  InboundRX iOS RFID Beacon Detecting Application
//  https://gitlab.com/InboundRX-Capstone/Paulsens-iOS-App
//
//  (c) 2017 Brett Chafin, Jason Brophy, Luke Kwak, Paul Huynh, Jason Custodio, Cher Moua, Thaddeus Sundin
//
//  You are free to use, copy, modify, and distribute this file, with attribution,
//  under the terms of the MIT license. See "license.txt" for more info.


/*
 Pop up for a reward item by displaying the product's title, point cost, description, image and a redeem button
*/

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
