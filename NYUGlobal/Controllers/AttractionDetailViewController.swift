//
//  AttractionDetailViewController.swift
//  NYUGlobal
//
//  Created by Xing Hui Lu on 2/21/16.
//  Copyright © 2016 Xing Hui Lu. All rights reserved.
//

import UIKit

class AttractionDetailViewController: UIViewController {

    var image: UIImage!
    var attractionDescription: String!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        descriptionView.text = attractionDescription
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
