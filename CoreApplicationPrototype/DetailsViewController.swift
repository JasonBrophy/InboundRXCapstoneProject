//
//  DetailsViewController.swift
//  CoreApplicationPrototype
//
//  Created by Luke Kwak on 3/13/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

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
            detailsCost.text = String(products!.cost)
            detailsDescription.text = products!.description
            
            detailsImage.image = products!.image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
