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
    var images = [UIImage(named: "1reward"),UIImage(named: "2reward"),UIImage(named: "3reward"),UIImage(named: "4reward"),UIImage(named: "5reward")]
    var productTitles: [String] = ["Product 1", "Product 2", "Product 3", "Product 4", "Product 5"]
    var descriptions = ["a", "b", "c", "d", "e"]
    var costs = [1, 2, 3, 4, 10]
    var products: [Product]? = nil
    
    
    
    @IBAction func unwindtoRewards(segue:UIStoryboardSegue) { }

    
    var points = 0
    var myString = ""
    
    //This will display the points in the text field
    func UpdatePoints(){
        self.phold.text = String(points)
    }
    
    @IBAction func showDetail(_ sender: Any?) {
        self.performSegue(withIdentifier: "rewardPopUp2", sender: sender as! UIButton)
    }
    
    //This is used to inc the points
    func incPoints(amount:Int){
        points = points + amount
        UpdatePoints()
    }
    
    //This can be used to decrease then points
    func decPoints(amount:Int){
        points = points - amount
        UpdatePoints()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UpdatePoints()
        self.rewardsCollectionView.delegate = self
        self.rewardsCollectionView.dataSource = self
        var temp: [Product] = []
        for count in 0..<images.count{
            temp.append(Product(title: productTitles[count], description: descriptions[count], cost: costs[count], image: images[count]!))
        }
        self.products = temp
        
      /*  self.products = [Product(title: productTitles[0], description: descriptions[0], cost: costs[0], image: images[0]!), Product(title: productTitles[1], description: descriptions[1], cost: costs[1], image: images[1]!), Product(title: productTitles[2], description: descriptions[2], cost: costs[2], image: images[2]!), Product(title: productTitles[3], description: descriptions[3], cost: costs[3], image: images[3]!), Product(title: productTitles[4], description: descriptions[4], cost: costs[4], image: images[4]!)]
*/
        //popUp.isHidden = true
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "rewardPopUp2" && sender != nil && products != nil){
            let button = sender as! UIButton
            let nextScene = segue.destination as! PopUpViewController
            for count in 0..<products!.count{
                let currImg = products![count].image
                if(button.currentImage!.isEqual(currImg)){
                    nextScene.product = products![count]
                    break
                }
            
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}


extension RewardsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if products != nil{
            return products!.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rewardsCollectionCell", for: indexPath) as! RewardsCollectionViewCell
        cell.product = products![indexPath.row]
        cell.productLabel.text = products![indexPath.row].title
        cell.productButton.setImage(products![indexPath.row].image, for: UIControlState.normal)
        cell.productCost.text = String(describing: products![indexPath.row].cost)
        
        myString = String(indexPath.row)        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
    }
    
    
}

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

