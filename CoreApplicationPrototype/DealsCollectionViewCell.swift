//
//  DealsCollectionViewCell.swift
//  CoreApplicationPrototype
//
//  Created by Luke Kwak on 3/13/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class DealsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dealsDescription: UITextView!
    @IBOutlet weak var dealsCost: UILabel!
    @IBOutlet weak var dealsImage: UIImageView!
    @IBOutlet weak var dealsTitle: UILabel!
    
    var product : Product? = nil
    
}
