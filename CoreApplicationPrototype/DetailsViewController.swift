//
//  DetailsViewController.swift
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
 Viewcontroller for deals popups, gets information through segue
*/

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsDescription: UITextView!
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var detailsCost: UILabel!
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    var products : Product? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        if(products != nil){
            detailsTitle.text = products!.title
            detailsCost.text = "Price: $" + String(products!.cost)
            detailsDescription.text = products!.description
            
            detailsImage.image = products!.image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
