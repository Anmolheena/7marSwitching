//
//  ViewController.swift
//  7marSwitching
//
//  Created by Appinventiv-PC on 07/03/18.
//  Copyright © 2018 Appinventiv-PC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    

  var imageArray:[UIImage] = []
   
   
    var change=false
    override func viewDidLoad() {
        super.viewDidLoad()
   
    collectionView.delegate = self
        collectionView.dataSource = self
        let itemSize = UIScreen.main.bounds.width/2-10
        let itemSize1=UIScreen.main.bounds.height/3-50
        let layout=UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(20,0,10,0)
        layout.itemSize = CGSize(width:itemSize,height:itemSize1)
        layout.minimumLineSpacing=0.5
        layout.minimumInteritemSpacing=0.5
        collectionView.collectionViewLayout=layout
        collectionView.reloadData()
        change=true
        
 
    for i in 1...10
        {
            imageArray.append(UIImage(named: "\(i).jpg") ?? #imageLiteral(resourceName: "1.jpg"))
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func switchBUttonTapped(_ sender: UIBarButtonItem) {
         if change        {
            let itemSize = UIScreen.main.bounds.width
            let itemSize1=UIScreen.main.bounds.height/5-50
            print(itemSize)
            let layout=UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsetsMake(0,0,10,0)
            layout.itemSize = CGSize(width:itemSize,height:itemSize1)
            layout.minimumLineSpacing=0.5
            layout.minimumInteritemSpacing=0.5
         collectionView.collectionViewLayout=layout
         collectionView.reloadData()
            change = false                                }
         else{
            let itemSize = UIScreen.main.bounds.width/2-10
            let itemSize1=UIScreen.main.bounds.height/3-50
            let layout=UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsetsMake(20,0,10,0)
            layout.itemSize = CGSize(width:itemSize,height:itemSize1)
            layout.minimumLineSpacing=0.5
            layout.minimumInteritemSpacing=0.5
            collectionView.collectionViewLayout=layout
            collectionView.reloadData()
            change=true
    
        }
        
    }
    


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return  imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath) as! CollectionViewCell
     
        cell.imageOutlet.image = UIImage(cgImage:imageArray[indexPath.row].cgImage!)
 return cell
        
    }
}
    

