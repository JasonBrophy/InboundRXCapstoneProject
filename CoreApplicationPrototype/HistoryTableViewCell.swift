//
//  HistoryTableViewCell.swift
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
 Describes layout of one tableView cell.
*/

import UIKit

class HistoryTableViewCell: UITableViewCell
{
    @IBOutlet weak var yearLabel: UILabel!   // Event Year
    @IBOutlet var historyView: UIImageView!  // Event Image
   
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!  // Event title
    
    class var expandedHeight: CGFloat { get { return 355 } }  //Height of custom view when expanded
    class var defaultHeight : CGFloat { get { return 44  } }  //Default height of view
}
