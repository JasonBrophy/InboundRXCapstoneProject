//
//  HistoryViewController.swift
//  CoreApplicationPrototype
//
//  Created by Jason Custodio 1/10/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

// Global Struct Event Custom Cell
struct event  {
    let year  : String!  // Year the event occurred
    let image : UIImage! // Image depicting event
    let title : String!
    let des   : String!
    
    init(year: String, image: UIImage, title: String, des: String) {
        self.year = year
        self.image = image
        self.title = title
        self.des = des
    }
}

class HistoryViewController: UITableViewController {
    
    let cellID = "cell"                      // Cell identifier for dequeue
    var selectedIndexPath  = -1              // -1 means no rows exist in section
    private var eventArray = [event]()       // Array of events for cells
    
    let webCallController = WebCallController()
    // Load data into table view cells
    
    func loadHistory(){
        var temp: [event] = []
        //server call
//        webCallController.getHistoricalEventList { (historicalEventsList) in
//            if historicalEventsList != nil {
//                var i = 0
//                for dict in historicalEventsList! {
//                    print("Event \(i):")
//                    print(dict)
//                    print("\n---\n")
//                    temp.append(event(year: dict["date"] as! String, image: #imageLiteral(resourceName: "Image0")))
//                    i = i+1
//                }
//              
//                self.eventArray = temp
//                
//            }
//        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView() // Create blank rows after filled in cells
        //eventArray = [event(year:"1969", image: #imageLiteral(resourceName: "Image0")),
        //              event(year:"1972", image: #imageLiteral(resourceName: "Image1")),
        //              event(year:"1984", image: #imageLiteral(resourceName: "Image0")),
        //              event(year:"1993", image: #imageLiteral(resourceName: "Image1"))
        //             ]
        loadHistory()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadHistory()
    }
    
    // CONFIGURING A TABLE VIEW (REQUIRED)
    // Tells the data source to return the number of rows in a given section of a table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventArray.count
    }
    
    // CONFIGURING A TABLE VIEW (REQUIRED)
    // Asks the data source for a cell to insert in a particular location of the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dequeued = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        let cell = dequeued as! HistoryTableViewCell             // Set cell as a custom cell
        
        cell.yearLabel.text    = eventArray[indexPath.row].year  // Set label in custom cell
        cell.historyView.image = eventArray[indexPath.row].image // Set image in custom cell
        cell.titleLabel.text = eventArray[indexPath.row].title
        cell.desLabel.text = eventArray[indexPath.row].des
        
        return cell
    }
    
    // MANAGING SELECTIONS
    // Tells the delegate that the specified row is now selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (selectedIndexPath == indexPath.row){  // If row is already selected
            selectedIndexPath = -1                // Don't expand/shrink
        }
        else {
            selectedIndexPath = indexPath.row     // Expand row
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    // CONFIGURING ROWS FOR THE TABLE VIEW
    // Asks the delegate for the height to use for a row in a specified location.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == selectedIndexPath {
            return HistoryTableViewCell.expandedHeight // When cell is selected, it is expanded
        } else {
            return HistoryTableViewCell.defaultHeight  // When cell is not selected, it is collapsed
        }
    }
}
