//
//  HomeViewController.swift
//  Keystone
//
//  Created by Adit Dhruv on 2018-04-04.
//  Copyright © 2018 Softchoice. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate{
    @IBOutlet weak var homeCollection: UICollectionView!
    
    let array:[String] = ["user", "camera", "inventory", "list", "add", "call"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemSize = UIScreen.main.bounds.width/2 - 1
        let itemSizeHeight = UIScreen.main.bounds.height/5 - 1
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSizeHeight)
        
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        
        homeCollection.collectionViewLayout = layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.imageViewCell.image = UIImage(named: array[indexPath.row] + ".png")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell Clicked with Index: " + String(indexPath.row))
        if(indexPath.row == 3) {
            performSegue(withIdentifier: "toTicketViewController", sender: nil)
        } else if(indexPath.row == 0) {
            performSegue(withIdentifier: "toProfileViewController", sender: nil)
        } else if(indexPath.row == 5) {
            performSegue(withIdentifier: "toContactViewController", sender: nil)
        }
    }
    
}
