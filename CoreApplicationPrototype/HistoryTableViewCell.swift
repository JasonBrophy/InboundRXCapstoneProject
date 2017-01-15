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
    var isObserving = false;
    @IBOutlet weak var yearLabel: UILabel! // History Year
    
    
    //@IBOutlet weak var historyView: UIImageView!  //USED TO IMPLEMENT IMAGES LATER
    
    class var expandedHeight: CGFloat { get { return 200 } }    //Height of custom view when expanded
    class var defaultHeight: CGFloat  { get { return 44  } }     //Default height of view
    
    /* USED TO IMPLEMENT IMAGES LATER
     //Called by tableViewContoller, image should be hidden when height is less than expanded height
     //func checkHeight() {
     //  historyView.isHidden = (frame.size.height < PickerTableViewCell.expandedHeight)
     }
     */
    
    //Whenever frame changes, evoke method
    func watchFrameChanges() {
        if !isObserving {
            addObserver(self, forKeyPath: "frame", options: [NSKeyValueObservingOptions.new, NSKeyValueObservingOptions.initial], context: nil)
            isObserving = true;
        }
    }
    
    func ignoreFrameChanges() {
        if isObserving {
            removeObserver(self, forKeyPath: "frame")
            isObserving = false;
        }
    }
    
    
    //Called after every frame change
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        /* if keyPath == "frame" {     //USED TO IMPLEMENT IMAGES LATER
         checkHeight()
         }
         */
    }

}
