//
//  RewardsCollectionViewCell.swift
//  CoreApplicationPrototype
//
//  Created by Luke Kwak on 2/14/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

protocol RewardsCollectionViewCellDelegate {
    func redeemDeal(forCell: RewardsCollectionViewCell)
    func infoDeal(forCell: RewardsCollectionViewCell)
}

class RewardsCollectionViewCell: UICollectionViewCell {

    var delegate: RewardsCollectionViewCellDelegate? = nil
    var product: Product? = nil
    
    //The items in the cell of the collection view
    @IBOutlet var productLabel: UILabel!
    @IBOutlet var productCost: UILabel!
    @IBOutlet var productButton: UIButton!
    
    
    //redeem button, does nothing at the moment
    @IBAction func redeemButton(_ sender: Any) {
        delegate?.redeemDeal(forCell: self)
    }
    
    
}
