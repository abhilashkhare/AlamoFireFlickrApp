//
//  AFFlickrClient.swift
//  AlamoFireFlickrApp
//
//  Created by Abhilash Khare on 7/25/18.
//  Copyright © 2018 Abhilash Khare. All rights reserved.
//

import Foundation
import Alamofire


class AFFlickrClient {
    static var sharedInstance = AFFlickrClient()
    
    func fetchImageGET(){
        Alamofire.request("https://api.flickr.com/services/rest/", method: .get, parameters: ["method":"flickr.photos.search","api_key":"c4deaa1b0a7b77672f46c6a4b145eccc", "text":"ocean","page":"1","format":"json","nojsoncallback":"1"]).responseJSON { (response) in
            print(response.value)
        }
        
    }
    
}


