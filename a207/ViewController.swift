//
//  ViewController.swift
//  a207
//
//  Created by 申潤五 on 2020/8/15.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let myImagePath = Bundle.main.path(forResource: "pic1", ofType: "jpeg"){
            myImageView.image = UIImage.init(contentsOfFile: myImagePath)
        }

    }


}

