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
    var farmID : AnyObject!
    var serverID : AnyObject!
    var ID : AnyObject!
    var secret : AnyObject!
    var url : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touchGetImage(_ sender: Any) {
        AFFlickrClient.sharedInstance.fetchImageGET { (result, error) in
            if(error != nil){
                print(error)
            }
            else{
                print(result!)
                if let farmid = result!["farm"] {
                    self.farmID = farmid
                    print(self.farmID!)
                }
                if let serverid = result!["server"] {
                    self.serverID = serverid
                    print(self.serverID!)
                }
                if let id = result!["id"] {
                    self.ID = id
                    print(self.ID!)
                }
                if let secretID = result!["secret"] {
                    self.secret = secretID
                    print(self.secret!)
                }
                
              self.url = "https://farm\(self.farmID!).staticflickr.com/\(self.serverID!)/\(self.ID!)_\(self.secret!).jpg"
                print(self.url!)
                
            }
        }
    }
}

