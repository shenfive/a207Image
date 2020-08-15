//
//  ImageViewController.swift
//  a207
//
//  Created by 申潤五 on 2020/8/15.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var theImage: UIImageView!
    var theSourceImage:UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theImage.image = theSourceImage
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
