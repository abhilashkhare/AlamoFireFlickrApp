//
//  ViewController.swift
//  AlamoFireFlickrApp
//
//  Created by Abhilash Khare on 7/24/18.
//  Copyright © 2018 Abhilash Khare. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touchGetImage(_ sender: Any) {
     AFFlickrClient.sharedInstance.fetchImageGET()
    }
}

