//
//  DealsViewController.swift
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
 Uses webcall to populate daily deals in a collective view cell
*/

import UIKit

class DealsViewController: UIViewController {
    @IBOutlet weak var dealsCollectionView: UICollectionView!
    var products : [Product]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDeals()
        dealsCollectionView.delegate = self
        dealsCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
        Dont really know why this makes things work.
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDeals()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the segue prepared for is going to the popup, and there is a product list
        // Get the cell the call came from and pass that cell's product on to the popup.
        if(segue.identifier == "dealsPopUp" && sender != nil && products != nil){
            let cell = sender as! DealsCollectionViewCell
            let next = segue.destination as! DetailsViewController
            next.products = cell.product
        }
    }
    
    
    /*
        Right now updateDeals() updates rewards since there is no test data with daily_deal == true
    */
    
    
    func updateDeals() {
        /*
        var temp: [Product] = []
        let webCallController = WebCallController()
        webCallController.getRewardsList/* getDailyDealList */ { (rewardsList/* dailyDealList */) in
            if rewardsList/* dailyDealList */ != nil {
                for dict in rewardsList! /* dailyDealList! */ {
                    if(dict["daily_deal"] as! Bool == false /*true*/ ){
                        temp.append(Product(title: dict["title"] as! String,
                                            description: dict["description"] as! String,
                                            cost: dict["cost"] as! Int,
                                            image: UIImage(named: "1reward")!))
                    }
                }
                self.products = temp
            }
        } */
    }

}

extension DealsViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if products != nil {
            return products!.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dealCell", for: indexPath) as! DealsCollectionViewCell
        cell.product = products![indexPath.row]
        cell.dealsTitle.text = products![indexPath.row].title
        cell.dealsImage.image = products![indexPath.row].image
        //cell.dealsDescription.text = products![indexPath.row].description
        //cell.dealsCost.text = String(describing: products![indexPath.row].cost)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
    }
    
}
