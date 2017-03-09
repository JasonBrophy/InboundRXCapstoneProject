//
//  RewardsViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 1/10/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

struct Product {
    var title: String
    var description: String
    var cost: Int
    var image: UIImage
    
    init(title: String, description: String, cost: Int, image: UIImage){
        self.title = title
        self.description = description
        self.cost = cost
        self.image = image
    }
}

class RewardsViewController: UIViewController{
    
    @IBOutlet weak var rewardsCollectionView: UICollectionView!
    @IBOutlet weak var prodButton: UIButton!
    @IBOutlet weak var phold: UILabel!
    //hardcoded array of images.
    var products = [Product]()
    
    
    @IBAction func unwindtoRewards(segue:UIStoryboardSegue) { }

    
    var points = 0
    var myString = ""
    
    
    //This will display the points in the text field
    func updatePoints(){
        //Call user to update and return points.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let user = appDelegate.user
        self.phold.text = user.updatePoints()
    }
    
    
    @IBAction func showDetail(_ sender: Any?) {
        self.performSegue(withIdentifier: "rewardPopUp2", sender: sender as! UIButton)
    }
    
    
    // Get the information from the web server regarding the rewards that are redeemable.
    func updateRewards() {
        let webCallController = WebCallController() // Create a web call controller object to make the call.
        webCallController.getRewardsList { (rewardsList) in
            // If the rewardsList retrieved is not empty, run through each dictionary in the list
            // If its not a daily deal, its a reward, so grab its relevant info to create the product.
            if rewardsList != nil {
                for dict in rewardsList! {
                    if(dict["daily_deal"] as! Bool == false){
                        self.products.append(Product(title: dict["title"] as! String, description: dict["description"] as! String, cost: dict["cost"] as! Int, image: UIImage(named: "1reward")!))
                    }
                    
                }
            }
            // Now that the call is finished, reload the collection view data into cells.
            self.rewardsCollectionView.reloadData()

        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updatePoints()
        updateRewards()
        self.rewardsCollectionView.delegate = self
        self.rewardsCollectionView.dataSource = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatePoints()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the segue prepared for is going to the popup, and there is a product list
        // Get the cell the call came from and pass that cell's product on to the popup.
        if(segue.identifier == "rewardPopUp2" && sender != nil){
            let button = sender as! UIButton
            let content = button.superview
            let cell = content?.superview as! RewardsCollectionViewCell
            let nextScene = segue.destination as! PopUpViewController
            nextScene.product = cell.product
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
}


extension RewardsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    
    // This function sets the cell's respective elements to the correct information by pulling it from the 
    // corresponding spot in the products list.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rewardsCollectionCell", for: indexPath) as! RewardsCollectionViewCell
        cell.product = products[indexPath.row]
        cell.productLabel.text = products[indexPath.row].title
        cell.productButton.setImage(products[indexPath.row].image, for: UIControlState.normal)
        cell.productCost.text = String(describing: products[indexPath.row].cost)
        
        myString = String(indexPath.row)        
        return cell
    }
    

}

//All of this could potentially be removed.
extension RewardsViewController: RewardsCollectionViewCellDelegate {
    
    //function for the redeem button
    func redeemDeal(forCell: RewardsCollectionViewCell) {
    }
    
    //function for the information popup
    func infoDeal(forCell: RewardsCollectionViewCell) {
        //let x = forCell.infoButton.currentTitle!
        //let y = Int(x)
        //popUp.setBackgroundImage(images[y!], for: .normal)
        //popUp.isHidden = false
        
    }
}

