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
    
    @IBOutlet var productLabel: UILabel!
    @IBOutlet var productCost: UILabel!
    @IBOutlet var productButton: UIButton!
    
    
    //background information
    @IBOutlet weak var infoButton: UIButton!
    @IBAction func infoButton(_ sender: Any) {
        delegate?.infoDeal(forCell: self)
    }
    
    //redeem button
    @IBAction func redeemButton(_ sender: Any) {
        delegate?.redeemDeal(forCell: self)
    }
    //action when the redeem button is pressed.
    func redeemMe() {
            //Do Nothing
    }
}
