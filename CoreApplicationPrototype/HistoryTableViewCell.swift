//
//  HistoryTableViewCell.swift
//  CoreApplicationPrototype
//
//  Created by Jason Custodio on 1/13/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell
{
    @IBOutlet weak var yearLabel: UILabel!   // History Year
    @IBOutlet var historyView: UIImageView!  // History Image
   
    
    class var expandedHeight: CGFloat { get { return 200 } }    //Height of custom view when expanded
    class var defaultHeight: CGFloat  { get { return 44  } }    //Default height of view
}
