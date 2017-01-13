//
//  HomeTableViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 1/12/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

//Global Struct for custom cells in tables
struct cellData  {
    
    let cell : Int!         //identifies what kind of cell (Deals, Rewards, etc.)
    let text : String!
    let image : UIImage!
}

class HomeTableViewController: UITableViewController {
    
    private var arrayOfCellData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sample cells. Would pull from web server data here
        arrayOfCellData = [cellData(cell: 1, text : "Daily Deal 1", image : #imageLiteral(resourceName: "XcodeMeds")),
                            cellData(cell: 2, text : "Daily Deal 2", image : #imageLiteral(resourceName: "XcodeMeds")),
                            cellData(cell: 3, text : "Daily Deal 3", image : #imageLiteral(resourceName: "XcodeMeds")),
                            cellData(cell: 3, text : "Daily Deal 4", image : #imageLiteral(resourceName: "XcodeMeds")),
                            cellData(cell: 3, text : "Daily Deal 5", image : #imageLiteral(resourceName: "XcodeMeds")),
                           ]
        
    }

    //returns the number of rows to be displayed
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cast a local cell as a Deals cell and fill it up
        let cell = Bundle.main.loadNibNamed("DealsTableViewCell", owner: self, options: nil)?.first as! DealsTableViewCell
            
        cell.Imageview.image = arrayOfCellData[indexPath.row].image
        cell.mainLabel.text = arrayOfCellData[indexPath.row].text
        
        return cell
    }
    
    //set height of cells
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
