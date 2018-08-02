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
                if let farmid = result!["farm"] {
                    self.farmID = farmid
                }
                if let serverid = result!["server"] {
                    self.serverID = serverid
                }
                if let id = result!["id"] {
                    self.ID = id
                }
                if let secretID = result!["secret"] {
                    self.secret = secretID
                }
              self.url = "https://farm\(self.farmID!).staticflickr.com/\(self.serverID!)/\(self.ID!)_\(self.secret!).jpg"
                print(self.url!)
                self.displayImage(self.url!)
            }
        }
    }
    
    func displayImage(_ url : String) -> Void {
        DispatchQueue.main.async {
     
        Alamofire.request(url).responseString { (response) in
            if response.error != nil{
                print(response.error.debugDescription)
            } else{
                self.imageView.image = UIImage(data: response.data!, scale: 1)
                }
            }
        }
    }


}

