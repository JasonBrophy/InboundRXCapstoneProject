//
//  DealsCollectionViewCell.swift
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
    A class to hold deals information.
*/

import UIKit

class DealsCollectionViewCell: UICollectionViewCell {
    /*\
        data that is used in the collection view on the home page
        description and cost are not shown in the home view.
    \*/
    @IBOutlet weak var dealsImage: UIImageView!
    @IBOutlet weak var dealsTitle: UILabel!
    
    var product : Product? = nil
    
}
