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
    
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dealsCollectionView.backgroundView = UILabel()
        let backgroundView = self.dealsCollectionView.backgroundView as! UILabel
        backgroundView.backgroundColor = UIColor.clear
        backgroundView.textAlignment = NSTextAlignment.center
        backgroundView.text = "There appears to be nothing here"
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
        self.dealsCollectionView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the segue prepared for is going to the popup, and there is a product list
        // Get the cell the call came from and pass that cell's product on to the popup.
        if(segue.identifier == "dealsPopUp" && sender != nil){
            let cell = sender as! DealsCollectionViewCell
            let next = segue.destination as! DetailsViewController
            next.products = cell.product
        }
    }
    
    
    /*
        Right now updateDeals() updates rewards since there is no test data with daily_deal == true
    */
    func updateDeals() {
        let webCallController = WebCallController()
        webCallController.getDailyDealList { (isError, errorMessage, dailyDealsList) in
            if !isError {
                for dict in dailyDealsList! {
                    self.products.append(Product(title: dict["title"] as! String,
                                        description: dict["description"] as! String,
                                        cost: dict["cost"] as! Int,
                                        image: UIImage(named: "2reward")!,
                                        id: dict["id"] as! Int))
                }
            } else {
                DispatchQueue.main.async(execute: { () -> Void in
                    let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle:UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated:true, completion:nil)
                })
                return
            }
            // Make sure the UI update occurs on the MAIN thread
            DispatchQueue.main.async(execute: { () -> Void in
                self.dealsCollectionView.reloadData()
                if(self.products.count > 0){
                    self.dealsCollectionView.backgroundView!.isHidden = true
                }
            })
        }
    }
}

extension DealsViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dealCell", for: indexPath) as! DealsCollectionViewCell
        cell.product = products[indexPath.row]
        cell.dealsTitle.text = products[indexPath.row].title
        cell.dealsImage.image = products[indexPath.row].image
        //cell.dealsDescription.text = products![indexPath.row].description
        //cell.dealsCost.text = String(describing: products![indexPath.row].cost)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
    }
    
}
