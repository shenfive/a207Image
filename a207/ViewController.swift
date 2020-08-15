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
        
        setLayoutTo(number: 2)
        
    }
    
    func setLayoutTo(number:Int){
        let screeSize = self.view.bounds.size //UIScreen.main.bounds.size
        print(screeSize)
        
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let side:CGFloat = (screeSize.width / CGFloat(number) ) - 10
        
        layout.itemSize = CGSize(width: side, height: side)
        
        myCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
    @IBAction func changLayOut(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        setLayoutTo(number: sender.selectedSegmentIndex + 2)
    }
    
    
    
    
    //MARK:CollectView Data Source & Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count * 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        cell.theImgeView.image = imageArray[indexPath.row % 5]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let alert = UIAlertController
            .init(title: "你選了",
                  message: "第 \(indexPath.row) 張圖 ",
                preferredStyle: .alert)
        let cancelBun = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        
        alert.addAction(cancelBun)
        
        let okBtn = UIAlertAction(title: "顯示", style: .default) { (alert) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "imageVC") as! ImageViewController
            nextVC.theSourceImage = self.imageArray[indexPath.row % 5]
            nextVC.modalPresentationStyle = .fullScreen
            nextVC.callBack = {
                let alert2 = UIAlertController(title: "謝謝", message: nil, preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert2.addAction(okBtn)
                self.present(alert2, animated: true, completion: nil)
            }
            self.present(nextVC, animated: true, completion: nil)
        }
        alert.addAction(okBtn)
        
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

