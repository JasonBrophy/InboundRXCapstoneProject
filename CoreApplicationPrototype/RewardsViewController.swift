//
//  RewardsViewController.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 1/10/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class RewardsViewController: UIViewController {

    
    @IBOutlet weak var rewardsCollectionView: UICollectionView!
    @IBOutlet weak var phold: UILabel!
    //hardcoded array of images.
    var images = [UIImage(named: "1reward"),UIImage(named: "2reward"),UIImage(named: "3reward"),UIImage(named: "4reward"),UIImage(named: "5reward")]
    
    
    //this is the popup that happens when a user presses for more info on a reward.
    @IBOutlet weak var popUp: UIButton!
    @IBAction func popUp(_ sender: Any) {
        popUp.isHidden = true
    }
    var points = 0
    var myString = ""
    
    //This will display the points in the text field
    func UpdatePoints(){
        self.phold.text = String(points)
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
        popUp.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}

extension RewardsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //number of kinds of sections. We only want one type of dimension, so return 1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //count how many images are in the array.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    //fill cell with an image in the array.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = rewardsCollectionView.dequeueReusableCell(withReuseIdentifier: "rewardsCollectionCell", for: indexPath) as! RewardsCollectionViewCell
        cell.infoButton.setBackgroundImage(images[indexPath.row], for: .normal)
        myString = String(indexPath.row)
        cell.infoButton.setTitle(myString, for: .normal)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

extension RewardsViewController: RewardsCollectionViewCellDelegate {
    
    //function for the redeem button
    func redeemDeal(forCell: RewardsCollectionViewCell) {
        let x = forCell.infoButton.currentTitle!
        forCell.redeemMe()
        print("redeemed ", x)
    }
    
    //function for the information popup
    func infoDeal(forCell: RewardsCollectionViewCell) {
        let x = forCell.infoButton.currentTitle!
        let y = Int(x)
        popUp.setBackgroundImage(images[y!], for: .normal)
        popUp.isHidden = false
        
    }
}
