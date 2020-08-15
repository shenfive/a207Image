//
//  ViewController.swift
//  a207
//
//  Created by 申潤五 on 2020/8/15.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    var imageArray = [UIImage?]()
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageArray = [
            UIImage(named: "pic1"),
            UIImage(named: "pic2"),
            UIImage(named: "pic3"),
            UIImage(named: "pic4"),
            UIImage(named: "pic5")
        ]
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        let screeSize = self.view.bounds.size //UIScreen.main.bounds.size
        print(screeSize)
        
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let side:CGFloat = (screeSize.width/3) - 10
        
        layout.itemSize = CGSize(width: side, height: side)
        
        myCollectionView.setCollectionViewLayout(layout, animated: true)
        
    }
    //MARK:CollectView Data Source & Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        cell.theImgeView.image = imageArray[indexPath.row]
        return cell
    }
}

