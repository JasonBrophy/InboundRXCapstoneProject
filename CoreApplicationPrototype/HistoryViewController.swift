//
//  HistoryViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 1/10/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class HistoryViewController: UITableViewController {

    let cellID = "cell"                 // Constant identifier for dequeue
    var selectedIndexPath: IndexPath?   // "?"(optional) because it begins as nil
    var yearArray = ["1976", "1972"]
    var i = 0
    
    
    /*
     Protocol: UITableViewDataSource
     
     Adopted by an object that mediates the application's data model
     for a UITableView object. The data source provides the table-view
     object with the information it needs to constrict and modify
     a table view
     - (developer.apple.com/reference/uikit/uittableviewdatasource)
     */
    
    // CONFIGURING A TABLE VIEW
    // Asks the data source to return the number of sections in the table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // CONFIGURING A TABLE VIEW (REQUIRED)
    // Tells the data source to return the number of rows in a given section of a table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yearArray.count
    }
    
    // CONFIGURING A TABLE VIEW (REQUIRED)
    // Asks the data source for a cell to insert in a particular location of the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if i == yearArray.count{
            i = 0
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HistoryTableViewCell
        cell.yearLabel.text = yearArray[i]
        i = i + 1
        return cell
    }
    
    
    
    
    /*
     Protocol: UITableViewDelegate
     The delegate of a UITableView object must adopt the UITableViewDelegate
     protocol. Optional methods of the protocol allow the delegate to manage
     selections, configure section headings and footers, help to delete and
     reorder cells, and perform other actions
     - (developer.apple.com/reference/uikit/uittableviewdelegate)
     */
    
    // MANAGING SELECTIONS
    // Tells the delegate that the specified row is now selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previousIndexPath = selectedIndexPath
        
        if indexPath == selectedIndexPath {             // Was selected, select again to collapse cell
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath               // Select cell to be expanded
        }
        
        
        var indexPaths : Array<IndexPath> = []          // Explicit optional unwrapping
        if let previous = previousIndexPath {           // Add an index path as long as a previous index path exists
            indexPaths += [previous]                    // First run through will not have a previous
        }
        
        
        if let current = selectedIndexPath {            // Same reason as above
            indexPaths += [current]
        }
        
        // If a cell is selected, reload the rows
        if indexPaths.count > 0 {                       // If there is at least one index path, reload the rows
            tableView.reloadRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
        }
    }
    
    // CONFIGURING ROWS FOR THE TABLE VIEW
    // Tells the delegate the table view is about to draw a cell for a particular row
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! HistoryTableViewCell).watchFrameChanges()
    }
    
    // TRACKING THE REMOVAL OF VIEWS
    // Tells the delegate that the specified cell was removed from the table
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! HistoryTableViewCell).ignoreFrameChanges()
    }
    
    // CONFIGURING ROWS FOR THE TABLE VIEW
    // Asks the delegate for the height to use for a row in a specified location.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {             // Gives control to cell
            return HistoryTableViewCell.expandedHeight   // When cell is selected, it is expanded
        } else {
            return HistoryTableViewCell.defaultHeight    // When cell is not selected, it is collapsed
        }
    }

}
